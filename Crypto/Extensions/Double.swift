//
//  Double.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 7.12.2025.
//

import Foundation
extension Double{
    private var currencyFormatter2:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current // default value
        //formatter.currencyCode = "usd" //<- change currency
        //formatter.currencySymbol  = "$"//<- change currency symbol
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
        
    }
    
    func asCurrencyWith2Decimals()->String{
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    private var currencyFormatter6:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current // default value
        //formatter.currencyCode = "usd" //<- change currency
        //formatter.currencySymbol  = "$"//<- change currency symbol
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
        
    }
    
    func asCurrencyWithDecimals()->String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    func asNumberString()->String{
        return String(format:"%.2f",self)
    }
    
    func asPercentString()->String{
        return asNumberString() + "%"
    }
}
