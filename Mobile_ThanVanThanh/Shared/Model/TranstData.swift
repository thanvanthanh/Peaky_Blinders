//
//  TranstData.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 19/08/2021.
//

import Foundation

struct Received: Codable {
    var dateTime: String
    var index: Int
    var content: String
    var transValue: String
    var type: Int
}

struct Withdrawn: Codable {
    var dateTime: String
    var index: Int
    var content: String
    var transValue: String
    var type: Int
}
