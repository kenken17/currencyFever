//
//  ModelCurrency.swift
//  Currency Fever
//
//  Created by Ken on 29/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import Foundation

class Currency {
    let name: String
    let code: String
    let currencyName: String

    init(name: String, code: String, currencyName: String) {
        self.name = name
        self.code = code
        self.currencyName = currencyName
    }
}