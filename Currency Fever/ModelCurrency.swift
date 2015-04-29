//
//  ModelCurrency.swift
//  Currency Fever
//
//  Created by Ken on 29/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import Foundation

class Currency {
    private let APIKey = "jr-38e855266eb396bc3bb2e62bc33a548c"
    let currency: currencyStruct
    
    // a basis struct of currency
    struct currencyStruct: Printable {
        let currencyStructName: String
        let currencyStructCode: String
        let currencyStructCurrency: String
        var currencyStructRate: [String: String]
        
        init(name: String, code: String, currency: String) {
            self.currencyStructName = name
            self.currencyStructCode = code
            self.currencyStructCurrency = currency
            self.currencyStructRate = [code: "1.00000000"]
        }
        
        var description: String {
            return self.currencyStructName + " : " + self.currencyStructCode + " : " + self.currencyStructCurrency
        }
    }
    
    // dictionary of countries supported
    private let currencies: [currencyStruct] = [
        currencyStruct(name: "Singapore", code: "SGD", currency: "Singapore Dollar"),
        currencyStruct(name: "Malaysia", code: "MYR", currency: "Malaysia Ringgit")
        
        /*
        AED = "2.78768215";
        AFN = "43.98148224";
        ALL = "97.00933819";
        AMD = "360.46600789";
        ANG = "1.35853066";
        AOA = "82.87795765";
        ARS = "6.75239071";
        AUD = "0.94256831";
        AWG = "1.35853066";
        AZN = "0.79758652";
        BAM = "1.33132210";
        BBD = "1.51791135";
        BDT = "59.15372495";
        BGN = "1.33067699";
        BHD = "0.28616424";
        BIF = "1184.72981178";
        BMD = "0.75895568";
        BND = "0.99981026";
        BOB = "5.24438373";
        BRL = "2.22780055";
        BSD = "0.75895568";
        BTN = "48.05517684";
        BWP = "7.43123862";
        BYR = "11004.85731633";
        BZD = "1.51411658";
        CAD = "0.90845856";
        CDF = "700.51608986";
        CHF = "0.71136916";
        CLF = "0.01867031";
        CLP = "460.68229736";
        CNH = "4.70670158";
        CNY = "4.70381755";
        COP = "1806.84574302";
        CRC = "403.19520340";
        CUP = "0.75895568";
        CVE = "75.38289390";
        CYP = "0.39841378";
        CZK = "18.66272010";
        DEM = "1.33132210";
        DJF = "134.50971160";
        DKK = "5.07574378";
        DOP = "34.00121357";
        DZD = "73.88054114";
        ECS = "18973.89192471";
        EGP = "5.78483607";
        ERN = "11.59684274";
        ETB = "15.56390407";
        EUR = "0.68069596";
        FJD = "1.52622192";
        FKP = "0.50675471";
        FRF = "4.46497420";
        GBP = "0.49086521";
        GEL = "1.76324378";
        GHS = "2.92197936";
        GIP = "0.49423194";
        GMD = "32.71098816";
        GNF = "5502.43607013";
        GTQ = "5.89822404";
        GYD = "157.26321114";
        HKD = "5.88228597";
        HNL = "16.68139117";
        HRK = "5.15395416";
        HTG = "35.84699302";
        HUF = "205.38098437";
        IDR = "9788.25136612";
        IEP = "0.53607999";
        ILS = "2.92732999";
        INR = "48.07563145";
        IQD = "900.12143291";
        IRR = "21531.57255616";
        ISK = "99.81025729";
        ITL = "1317.97591302";
        JMD = "87.48861718";
        JOD = "0.53760625";
        JPY = "90.26829083";
        KES = "71.82263130";
        KGS = "45.81056542";
        KHR = "3043.37427975";
        KMF = "334.87152019";
        KPW = "683.06010929";
        KRW = "809.99924484";
        KWD = "0.22849879";
        KYD = "0.62234366";
        KZT = "141.08227004";
        LAK = "6145.60579463";
        LBP = "1144.50516090";
        LKR = "101.07012599";
        LRD = "64.25319065";
        LSL = "8.90008349";
        LTL = "2.22677596";
        LVL = "0.47840771";
        LYD = "1.03973133";
        MAD = "7.40463722";
        MDL = "13.71812462";
        MGA = "2360.84540225";
        MKD = "41.97024818";
        MMK = "821.34179645";
        MNT = "1491.34790528";
        MOP = "6.05870522";
        MRO = "235.27625987";
        MUR = "26.75318761";
        MVR = "11.68791743";
        MWK = "333.93669930";
        MXN = "11.52189587";
        MXV = "2.13266545";
        MYR = "2.68784153";
        MZN = "26.94292653";
        NAD = "8.90008349";
        NGN = "151.03217972";
        NIO = "20.51062462";
        NOK = "5.68268063";
        NPR = "76.88828097";
        NZD = "0.98186931";
        OMR = "0.29220173";
        PAB = "0.75895568";
        PEN = "2.36805556";
        PGK = "2.04379174";
        PHP = "33.58910140";
        PKR = "77.20476472";
        PLN = "2.72677596";
        PYG = "3824.57888358";
        QAR = "2.76244687";
        RON = "3.00322556";
        RSD = "81.75090771";
        RUB = "38.75644961";
        RWF = "524.05889496";
        SAR = "2.84631148";
        SBD = "5.85753415";
        SCR = "10.26977080";
        SDG = "4.52717061";
        SEK = "6.31086825";
        SGD = "1.00000000";
        SHP = "0.49423194";
        SIT = "163.11760170";
        SLL = "3313.60048573";
        SOS = "530.47207954";
        SRD = "2.50455373";
        STD = "16892.45598057";
        SVC = "6.63706740";
        SYP = "143.38873786";
        SZL = "8.90008349";
        THB = "24.94687234";
        TJS = "4.74005768";
        TMT = "2.65634487";
        TND = "1.45412113";
        TOP = "1.50734669";
        TRY = "2.01244687";
        TTD = "4.81367638";
        TWD = "23.05365817";
        TZS = "1506.86851169";
        UAH = "15.74833030";
        UGX = "2269.27747420";
        USD = "0.75895568";
        UYU = "19.82771706";
        UZS = "1907.05068306";
        VEF = "4.81936855";
        VND = "16385.85306618";
        VUV = "81.40937993";
        WST = "1.87807453";
        XAF = "446.49532939";
        XAG = "0.04575592";
        XAU = "0.00062766";
        XBT = "0.00337122";
        XCD = "2.04918033";
        XCP = "0.27163783";
        XDR = "0.54018670";
        XOF = "446.49532939";
        XPD = "0.00097222";
        XPF = "81.22639876";
        XPT = "0.00065574";
        YER = "163.21342061";
        ZAR = "8.89317699";
        ZMW = "5.62386157";
        ZWL = "244.65316560";
        */
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
    
    func getRate() {
        var url: String = "http://jsonrates.com/get/?apiKey=" + self.APIKey + "&base=" + currency.currencyStructCode
        
        var request: NSMutableURLRequest = NSMutableURLRequest()
        
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request,
            queue: NSOperationQueue(),
            completionHandler:{
                (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                
                var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
                
                let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
                
                if (jsonResult != nil) {
                    println(jsonResult);
                } else {
                    println(error)
                    // couldn't load JSON, look at error
                }
            }
        )
    }
}