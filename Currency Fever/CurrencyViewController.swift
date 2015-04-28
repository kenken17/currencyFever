//
//  ViewController.swift
//  Currency Fever
//
//  Created by Ken on 27/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var currencies = [Currency]()
        
        var c = Currency("SGD")
        
        c.getRate("jr-38e855266eb396bc3bb2e62bc33a548c")
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

