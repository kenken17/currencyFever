//
//  ModelCurrency.swift
//  Currency Fever
//
//  Created by Ken on 29/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import Foundation

protocol CurrencyDelegate {
    func loadingWillStart()
    func loadingDidEnd()
    func dataUpdated()
}

class Currency: Printable {
    let APIKey = "jr-38e855266eb396bc3bb2e62bc33a548c"
    let code: String
    let currencyName: String
    var rates = [String: Double]()
    
    var delegate: CurrencyDelegate?
    
    // dictionary of countries supported
    let countries = [
        "AED": "Arab Emirates Dirham",
        "AFN": "Afghanistan Afghani",
        "ALL": "Albanian Lek",
        "AMD": "Armenian Dram",
        "ANG": "Netherlands Antillean Guilder",
        "AOA": "Angolan Kwanza",
        "ARS": "Argentine Peso",
        "AUD": "Australian Dollar",
        "AWG": "Aruban Guilder",
        "AZN": "Azerbaijan New Manat",
        "BAM": "Bosnia-Herzegovina Convertible Mark",
        "BBD": "Barbados Dollar",
        "BDT": "Bangladeshi Taka",
        "BGN": "Bulgarian Lev",
        "BHD": "Bahraini Dinar",
        "BIF": "Burundi Franc",
        "BMD": "Bermudian Dollar",
        "BND": "Brunei Dollar",
        "BOB": "Boliviano",
        "BRL": "Brazilian Real",
        "BSD": "Bahamian Dollar",
        "BTN": "Bhutan Ngultrum",
        "BWP": "Botswana Pula",
        "BYR": "Belarussian Ruble",
        "BZD": "Belize Dollar",
        "CAD": "Canadian Dollar",
        "CDF": "Congolese Franc",
        "CHF": "Swiss Franc",
        "CLF": "Unidad de Fomento",
        "CLP": "Chilean Peso",
        "CNH": "Offshore Yuan Renminbi",
        "CNY": "Yuan Renminbi",
        "COP": "Colombian Peso",
        "CRC": "Costa Rican Colon",
        "CUP": "Cuban Peso",
        "CVE": "Cape Verde Escudo",
        "CZK": "Czech Koruna",
        "DJF": "Djibouti Franc",
        "DKK": "Danish Krone",
        "DOP": "Dominican Peso",
        "DZD": "Algerian Dinar",
        "EGP": "Egyptian Pound",
        "ERN": "Eritrean Nakfa",
        "ETB": "Ethiopian Birr",
        "EUR": "Euro",
        "FJD": "Fiji Dollar",
        "FKP": "Falkland Islands Pound",
        "GBP": "Pound Sterling",
        "GEL": "Georgian Lari",
        "GHS": "Ghanaian Cedi",
        "GIP": "Gibraltar Pound",
        "GMD": "Gambian Dalasi",
        "GNF": "Guinea Franc",
        "GTQ": "Guatemalan Quetzal",
        "GYD": "Guyana Dollar",
        "HKD": "Hong Kong Dollar",
        "HNL": "Honduran Lempira",
        "HRK": "Croatian Kuna",
        "HTG": "Haitian Gourde",
        "HUF": "Hungarian Forint",
        "IDR": "Indonesian Rupiah",
        "IEP": "Irish Pound (replaced by EUR)",
        "ILS": "Israeli New Shekel",
        "INR": "Indian Rupee",
        "IQD": "Iraqi Dinar",
        "IRR": "Iranian Rial",
        "ISK": "Iceland Krona",
        "JMD": "Jamaican Dollar",
        "JOD": "Jordanian Dinar",
        "JPY": "Japanese Yen",
        "KES": "Kenyan Shilling",
        "KGS": "Kyrgyzstani Som",
        "KHR": "Kampuchean Riel",
        "KMF": "Comoros Franc",
        "KPW": "North Korean Won",
        "KRW": "Korean Won",
        "KWD": "Kuwaiti Dinar",
        "KYD": "Cayman Islands Dollar",
        "KZT": "Kazakhstan Tenge",
        "LAK": "Lao Kip",
        "LBP": "Lebanese Pound",
        "LKR": "Sri Lanka Rupee",
        "LRD": "Liberian Dollar",
        "LSL": "Lesotho Loti",
        "LTL": "Lithuanian Litas",
        "LVL": "Latvian Lats",
        "LYD": "Libyan Dinar",
        "MAD": "Moroccan Dirham",
        "MDL": "Moldovan Leu",
        "MGA": "Malagasy Ariary",
        "MKD": "Macedonian Denar",
        "MMK": "Myanmar Kyat",
        "MNT": "Mongolian Tugrik",
        "MOP": "Macau Pataca",
        "MRO": "Mauritanian Ouguiya",
        "MUR": "Mauritius Rupee",
        "MVR": "Maldive Rufiyaa",
        "MWK": "Malawi Kwacha",
        "MXN": "Mexican Nuevo Peso",
        "MXV": "Mexican Unidad de Inversion",
        "MYR": "Malaysian Ringgit",
        "MZN": "Mozambique Metical",
        "NAD": "Namibian Dollar",
        "NGN": "Nigerian Naira",
        "NIO": "Nicaraguan Cordoba Oro",
        "NOK": "Norwegian Krone",
        "NPR": "Nepalese Rupee",
        "NZD": "New Zealand Dollar",
        "OMR": "Omani Rial",
        "PAB": "Panamanian Balboa",
        "PEN": "Peruvian Nuevo Sol",
        "PGK": "Papua New Guinea Kina",
        "PHP": "Philippine Peso",
        "PKR": "Pakistan Rupee",
        "PLN": "Polish Zloty",
        "PYG": "Paraguay Guarani",
        "QAR": "Qatari Rial",
        "RON": "Romanian New Leu",
        "RSD": "Serbian Dinar",
        "RUB": "Russian Ruble",
        "RWF": "Rwanda Franc",
        "SAR": "Saudi Riyal",
        "SBD": "Solomon Islands Dollar",
        "SCR": "Seychelles Rupee",
        "SDG": "Sudanese Pound",
        "SEK": "Swedish Krona",
        "SGD": "Singapore Dollar",
        "SHP": "St. Helena Pound",
        "SLL": "Sierra Leone Leone",
        "SOS": "Somali Shilling",
        "SRD": "Surinam Dollar",
        "STD": "São Tomé and Príncipe Dobra",
        "SVC": "El Salvador Colon",
        "SYP": "Syrian Pound",
        "SZL": "Swaziland Lilangeni",
        "THB": "Thai Baht",
        "TJS": "Tajik Somoni",
        "TMT": "Turkmenistani Manat",
        "TND": "Tunisian Dollar",
        "TOP": "Tongan Pa'anga",
        "TRY": "Turkish Lira",
        "TTD": "Trinidad and Tobago Dollar",
        "TWD": "Taiwan Dollar",
        "TZS": "Tanzanian Shilling",
        "UAH": "Ukraine Hryvnia",
        "UGX": "Uganda Shilling",
        "USD": "US Dollar",
        "UYU": "Uruguayan Peso",
        "UZS": "Uzbekistan Sum",
        "VEF": "Venezuelan Bolivar",
        "VND": "Vietnamese Dong",
        "VUV": "Vanuatu Vatu",
        "WST": "Samoan Tala",
        "XAF": "CFA Franc BEAC",
        "XAG": "Silver Ounce",
        "XAU": "Gold Ounce",
        "XBT": "Bitcoin",
        "XCD": "East Caribbean Dollar",
        "XCP": "Ounces of Copper",
        "XDR": "IMF Special Drawing Rights",
        "XOF": "CFA Franc BCEAO",
        "XPD": "Palladium Ounce",
        "XPF": "CFP Franc",
        "XPT": "Platinum Ounce",
        "YER": "Yemeni Rial",
        "ZAR": "South African Rand",
        "ZMW": "Zambian Kwacha",
        "ZWL": "Zimbabwe Dollar"
    ]
    
    var description: String {
        return currencyName + " : " + code + " : " + "\(rates)"
    }
    
    // designated init using country code
    init(_ code: String) {
        self.code = code
        self.currencyName = countries[code] ?? "Unknown"
    }
    
    func getRate(code: String) -> [String: Double]? {
        var url: String = "http://jsonrates.com/get/?apiKey=" + APIKey + "&base=" + code
        
        var request: NSMutableURLRequest = NSMutableURLRequest()
        
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"

        self.delegate?.loadingWillStart()
        
        NSURLConnection.sendAsynchronousRequest(request,
            queue: NSOperationQueue(),
            completionHandler: {
                (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                
                var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
                
                let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
                
                if (jsonResult != nil) {
                    if let rates = jsonResult["rates"] as? [String: String] {
                        for (code, _) in self.countries {
                           self.rates[code] = (rates[code]! as NSString).doubleValue
                        }
                    }
                } else {
                    // couldn't load JSON, look at error
                    println(error)
                    self.rates = [code: 0.00000000]
                }
       
                self.delegate?.loadingDidEnd()
                self.delegate?.dataUpdated()
            }
        )
        
        return nil
    }
}
