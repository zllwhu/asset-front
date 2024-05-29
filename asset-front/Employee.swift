//
//  Employee.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import Foundation
import SwiftData

@Model
class Employee {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
