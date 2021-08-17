//
//  DetailSceneWorker.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 17/08/2021.
//

import Foundation

func readJson() {
    // Get url for file
    guard let fileUrl = Bundle.main.url(forResource: "TransactionHistory", withExtension: "json") else {
        print("File could not be located at the given url")
        return
    }

    do {
        // Get data from file
        let data = try Data(contentsOf: fileUrl)

        // Decode data to a Dictionary<String, Any> object
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            print("Could not cast JSON content as a Dictionary<String, Any>")
            return
        }

        // Print result
        print(dictionary)
    } catch {
        // Print error if something went wrong
        print("Error: \(error)")
    }
}
