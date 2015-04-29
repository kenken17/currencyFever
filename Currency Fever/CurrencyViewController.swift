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
    var currencies = [Currency]()
    var myCurrencies = ["SGD", "MYR"] // list of users currencies
    var currenValue: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the UITableView delegate
        CurrencyTableView.delegate = self
        CurrencyTableView.dataSource = self
        
        // Pull all the currencies
        for c in myCurrencies {
            let curr = Currency(c)
            
            // TODO: Setup the currencies

            currencies.append(curr);
        }
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(myCurrencies.count)
        return myCurrencies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(self.currencyTableViewCellIdentifier, forIndexPath: indexPath) as! CurrencyTableViewCell
        
        let currency = currencies[indexPath.row]
        let code = currency.currency.currencyStructCode
        let rates = currency.currency.currencyStructRate
    
        cell.UILabelName!.text = currency.currency.currencyStructCurrency
        cell.UILabelCode!.text = currency.currency.currencyStructCode
        cell.UILabelValue!.text = rates[code]

        return cell
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}

