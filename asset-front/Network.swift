//
//  Network.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    @Published var assets: [Asset] = []
    
    func getAssets() {
        guard let url = URL(string: "http://127.0.0.1:8080/asset/query") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedAssets = try JSONDecoder().decode([Asset].self, from: data)
                        self.assets = decodedAssets
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func removeAsset(id: Int) {
        guard let url = URL(string: "http://127.0.0.1:8080/asset/remove?id=\(id)") else { fatalError("Missing URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (_, _, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
        }
        dataTask.resume()
    }
    
    func recordAsset(id: String, item_name: String, item_quantity: String,
                     item_price: String, item_sum_value: String, receipt_date: String,
                     receipt_department: String, receipt_person: String,
                     approver: String, addition: String) {
        guard let url = URL(string: "http://127.0.0.1:8080/asset/record?id=\(id)&item_name=\(item_name)&item_quantity=\(item_quantity)&item_price=\(item_price)&item_sum_value=\(item_sum_value)&receipt_date=\(receipt_date)&receipt_department=\(receipt_department)&receipt_person=\(receipt_person)&approver=\(approver)&addition=\(addition)") else { fatalError("Missing URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (_, _, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
        }
        dataTask.resume()
    }
}
