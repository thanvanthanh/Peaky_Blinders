//
//  TransactionHistory.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 17/08/2021.
//

import Foundation

struct ResultItem: Codable {
    
    var dateTime: String
    var index: Int
    var type: Int
    var content: String
    var transValue: Float
}
