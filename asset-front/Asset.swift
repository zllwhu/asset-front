//
//  Asset.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import Foundation

struct Asset: Identifiable, Decodable {
    var id: Int
    var item_name: String
    var item_quantity: Int
    var item_price: Int
    var item_sum_value: Int
    var receipt_date: String
    var receipt_department: String
    var receipt_person: String
    var approver: String
    var addition: String
    
    init(id: Int, item_name: String, item_quantity: Int, item_price: Int, item_sum_value: Int, receipt_date: String, receipt_department: String, receipt_person: String, approver: String, addition: String) {
        self.id = id
        self.item_name = item_name
        self.item_quantity = item_quantity
        self.item_price = item_price
        self.item_sum_value = item_sum_value
        self.receipt_date = receipt_date
        self.receipt_department = receipt_department
        self.receipt_person = receipt_person
        self.approver = approver
        self.addition = addition
    }
}
