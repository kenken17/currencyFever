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
    var myCurrencies = ["SGD", "MYR", "TWD", "IDR", "AUD"] // list of users currencies
    var currentCurrency: Currency?
    var currentValue = 1.00
    var refreshControl:UIRefreshControl!
    var updatedAt = ""

    // MARK: UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // go and fetch the latest rates for all currencies in list
        getLatestRates()
        
        self.currentCurrency = currencies[myCurrencies[0]]!
        
        // remove the cell separator
        CurrencyTableView.separatorColor = UIColor.blackColor().colorWithAlphaComponent(0.05)
        
        // refresh control
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        CurrencyTableView.addSubview(refreshControl)
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
            cell.UIImageViewFlag!.image = UIImage(named: code)
        }
        
        let result = String(format:"%.2f", value ?? 0)
        let stringLength = count(result)
        
        let valueIndex = stringLength - 3
        let decimalIndex = stringLength - 3
        let valueString = result.substringToIndex(advance(result.startIndex, valueIndex))
        let decimalString = result.substringFromIndex(advance(result.startIndex, decimalIndex))
        
        cell.UILabelName!.text = currencyName
        cell.UILabelCode!.text = code
        cell.UILabelValue!.text = valueString
        cell.UILabelDecimal!.text = decimalString
        
        return cell
    }
    
    // MARK: CurrencyDelegate methods
    func loadingWillStart(sender: Currency) {
        // Loading start
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func loadingDidEnd(sender: Currency) {
        // Loading stop
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        var dateString = ""
        
        // Format the date for human
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        
        // first convert from string to date
        let dateObj = dateFormatter.dateFromString(sender.updatedAt as String)
        
        if let date = dateObj {
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.timeStyle = .ShortStyle
            
            dateString = dateFormatter.stringFromDate(date)
        }
        
        println(dateString)
        
        // update the refresh control text
        refreshControl.attributedTitle = NSAttributedString(string: "Updated at " + dateString)
    }
    
    func dataUpdated() {
        dispatch_async(dispatch_get_main_queue(), {
            self.CurrencyTableView.reloadData()
            self.refreshControl.endRefreshing()
        })
    }
    
    // MARK: Refresh control
    func refresh(sender:AnyObject) {
        getLatestRates()
    }
    
    // MARK: Local methods
    func getLatestRates() {
        // Pull all the currencies
        for c in myCurrencies {
            currencies[c] = Currency(c)
            currencies[c]?.delegate = self
            currencies[c]?.getRate(c)
        }
    }
    
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

