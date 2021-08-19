//
//  ConvertHelper.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 19/08/2021.
//

import Foundation

class ConvertHelper {
    static func stringFromDate(money: String, format: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currencyAccounting
//        formatter.locale = Locale(identifier: "DE")
        formatter.currencyCode = "vnd"
        let string = formatter.string(from: 1234567) ?? ""
        return string
    }
}
