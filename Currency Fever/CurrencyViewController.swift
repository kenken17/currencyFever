//
//  ViewController.swift
//  Currency Fever
//
//  Created by Ken on 27/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import UIKit


class CurrencyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Variables
    @IBOutlet weak var CurrencyTableView: UITableView!
    
    var currencyTableViewCellIdentifier = "currencyTableViewCell"
    var currencies: Dictionary<String, Currency> = [:]
    var myCurrencies = ["SGD", "MYR", "USD", "TWD", "IDR", "AUD"] // list of users currencies
    var currenCurrency: Currency?
    var currenValue = 1.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the UITableView delegate
        CurrencyTableView.delegate = self
        CurrencyTableView.dataSource = self
        
        // Pull all the currencies
        for c in myCurrencies {
            currencies[c] = Currency(c);
        }
        
        self.currenCurrency = currencies[myCurrencies[0]]!
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateRates", name: "newRates", object: nil)
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
    
    func updateRates() {
        updateCurrentCurrency(nil)
        
        println(currenCurrency!)
        
        CurrencyTableView.reloadData()
    }
    
    func updateCurrentCurrency(selectedCode: String?) -> Double {
        // Get the rate against the current selected currency
        let rates = currenCurrency!.rates
        var code: String
        
        if selectedCode == nil {
            code = myCurrencies[0]
        } else {
           code = selectedCode!
        }
        
        if let rate = rates[code] {
            return currenValue * rates[code]!
        }
        
        return 1.00
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}

