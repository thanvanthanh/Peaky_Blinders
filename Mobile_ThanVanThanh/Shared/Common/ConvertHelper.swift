//
//  ConvertHelper.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 19/08/2021.
//

import Foundation

class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let string = formatter.string(from: date)
        return string
    }
}
