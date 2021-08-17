//
//  TransactionHistory.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 17/08/2021.
//

import Foundation

class TransactionHistory {
    init () {
        self.dateTime = ""
        self.index = 0
        self.type = 0
        self.content = ""
        self.transValue = 0.0
    }
    init(dateTime: String = "", index: Int, type: Int, content: String, transValue: Float) {
        self.dateTime = dateTime
        self.index = index
        self.type = type
        self.content = content
        self.transValue = transValue
    }
    
    var dateTime: String = ""
    var index: Int
    var type: Int
    var content: String
    var transValue: Float
}
