//
//  ModelCurrency.swift
//  Currency Fever
//
//  Created by Ken on 29/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import Foundation

class Currency {
    let currency: currencyStruct
    
    // A basis struct of currency
    struct currencyStruct: Printable {
        let currencyStructName: String
        let currencyStructCode: String
        let currencyStructCurrency: String
        
        init(name: String, code: String, currency: String) {
            self.currencyStructName = name
            self.currencyStructCode = code
            self.currencyStructCurrency = currency
        }
        
        var description: String {
            return self.currencyStructName + " : " + self.currencyStructCode + " : " + self.currencyStructCurrency
        }
    }
    
    // dictionary of countries supported
    let currencies: [currencyStruct] = [
        currencyStruct(name: "Singapore", code: "SGD", currency: "Singapore Dollar"),
        currencyStruct(name: "Malaysia", code: "MYR", currency: "Malaysia Ringgit")
    ]
    
    // designated init using country code
    init(_ code: String) {
        var name: String = ""
        var currency: String = ""
        
        // lookup for the countries array and setup the struct
        for curr in currencies {
            if curr.currencyStructCode == code {
                name = curr.currencyStructName
                currency = curr.currencyStructCurrency
            }
        }
    
        self.currency = currencyStruct(name: name, code: code, currency: currency)
    }
    
    func getRate(API: String) {
        var url: String = "http://jsonrates.com/get/?apiKey=" + API + "&base=" + currency.currencyStructCode
        
        var request: NSMutableURLRequest = NSMutableURLRequest()
        
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            if (jsonResult != nil) {
                println(jsonResult);
            } else {
                println(error)
                // couldn't load JSON, look at error
            }
        })
    }
}