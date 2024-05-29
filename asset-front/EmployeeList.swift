//
//  EmployeeList.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import SwiftUI

struct EmployeeList: View {
    var employees: [Employee] = [
        Employee(name: "Alice"),
        Employee(name: "Bob"),
        Employee(name: "Cindy"),
        Employee(name: "David"),
        Employee(name: "Nick"),
    ]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(employees) { employee in
                    Text("\(employee.name)")
                }
            }
            .navigationTitle("Employees")
            .deleteDisabled(true)
        } detail: {
            Text("Select a employee")
                .navigationTitle("Employee")
        }
    }
}

#Preview {
    EmployeeList()
}
