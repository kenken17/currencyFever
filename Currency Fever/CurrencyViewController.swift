//
//  ViewController.swift
//  Currency Fever
//
//  Created by Ken on 27/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CurrencyDelegate {

    // MARK: Variables
    @IBOutlet weak var CurrencyTableView: UITableView!
    
    var currencyTableViewCellIdentifier = "currencyTableViewCell"
    var currencies: Dictionary<String, Currency> = [:]
    var myCurrencies = ["SGD", "MYR"] // list of users currencies
    var currentCurrency: Currency?
    var currentValue = 1.00
    
    // MARK: UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Pull all the currencies
        for c in myCurrencies {
            currencies[c] = Currency(c)
            currencies[c]?.delegate = self
            currencies[c]?.getRate(c)
        }
        
        self.currentCurrency = currencies[myCurrencies[0]]!
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCurrencies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.currencyTableViewCellIdentifier, forIndexPath: indexPath) as! CurrencyTableViewCell
        
        let currency = myCurrencies[indexPath.row]
        let myCurrency = currencies[currency]
        
        // println(myCurrency)
        
        let currencyName = myCurrency!.currencyName
        let code = myCurrency!.code
        
        var value = updateCurrentCurrency(code)

        // setup the properties
        if currencyName != "unknown" {
            cell.UIImageViewFlag!.image = UIImage(named: currencyName)
        }

        cell.UILabelName!.text = currencyName
        cell.UILabelCode!.text = code
        cell.UILabelValue!.text = String(format:"%.2f", value ?? 0)   // round to 2 decimal

        return cell
    }
    
    // MARK: CurrencyDelegate methods
    func loadingWillStart() {
        // Loading start
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func loadingDidEnd() {
        // Loading stop
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func dataUpdated() {
        dispatch_async(dispatch_get_main_queue(), {
            self.CurrencyTableView.reloadData()
        })
    }
    
    // MARK: Local methods
    func updateCurrentCurrency(selectedCode: String?) -> Double {
        // Get the rate against the current selected currency
        let rates = currentCurrency!.rates
        var code: String
        
        if selectedCode == nil {
            code = myCurrencies[0]
        } else {
           code = selectedCode!
        }
        
        if let rate = rates[code] {
            return currentValue * rates[code]!
        }
        
        return 0.00
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}

