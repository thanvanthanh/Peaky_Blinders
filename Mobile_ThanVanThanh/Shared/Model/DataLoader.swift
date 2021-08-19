//
//  TransactionHistory.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 17/08/2021.
//

import Foundation

public class DataLoader {
    @Published  var transData = [Received]()
    @Published var withdrawnData = [Withdrawn]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "TransactionHistory", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Received].self, from: data)
                
                self.transData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    func sort() {
        self.transData = self.transData.sorted(by: { $0.index < $1.index })
    }
    
}
public class WidthLoader {
    @Published var withdrawnData = [Withdrawn]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "Withdrawn", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Withdrawn].self, from: data)
                
                self.withdrawnData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    func sort() {
        self.withdrawnData = self.withdrawnData.sorted(by: { $0.index < $1.index })
    }
    
}
