//
//  DetailSceneWorker.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 17/08/2021.
//

import Foundation

protocol DetailSceneWorkerLogic {
    func getSumariesTransactionHistory(type: Int, filter: Int, completion:(Bool, Any?, Error) -> Void)
}

class DetailSceneWorker: DetailSceneWorkerLogic {
    func getSumariesTransactionHistory(type:Int, filter: Int, completion:(Bool, Any?, Error) -> Void) {
        guard let path = Bundle.main.path(forResource: "TransactionHistory", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            var listTrans: [TransactionHistory] = []
            guard let array = json as? [[String: Any]] else { return }
            for trans in array {
                let newTransaction = TransactionHistory()
                
                var randomType = Int.random(in: 0...1)
                if (filter != -1) {
                    randomType = filter
                }
                newTransaction.dateTime = trans["dateTime"] as! String
                newTransaction.content = trans["content"] as! String
                newTransaction.transValue = Float(trans["transValue"] as! String) ?? 0.0
                newTransaction.type = randomType
                listTrans.append(newTransaction)
            }
            completion(true, listTrans, "" as! Error)
        } catch {
            completion(false, nil, error)
        }
    }
}
