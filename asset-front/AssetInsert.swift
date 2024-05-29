//
//  AssetInsert.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import SwiftUI
import SwiftData

struct AssetInsert: View {
    @Bindable var asset: AssetToInsert
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var network: Network
    
    @Query(sort: \Employee.name)private var employees: [Employee]
    
    init(asset: AssetToInsert) {
        self.asset = asset
    }
    
    var body: some View {
        Form {
            Section("Asset ID") {
                TextField("Asset ID", text: $asset.id)
            }
            Section("Asset Name") {
                TextField("Asset Name", text: $asset.item_name)
            }
            Section("Asset Quantity") {
                TextField("Asset Quantity", text: $asset.item_quantity)
            }
            Section("Asset Price") {
                TextField("Asset Price", text: $asset.item_price)
            }
            Section("Asset Sum Value") {
                TextField("Asset Sum Value", text: $asset.item_sum_value)
            }
            Section("Asset Receipt Date") {
                TextField("Asset Receipt Date", text: $asset.receipt_date)
            }
            Section("Asset Receipt Department") {
                TextField("Asset Receipt Department", text: $asset.receipt_department)
            }
            Section("Asset Receipt Person") {
//                Picker("Asset Receipt Person", selection: $asset.receipt_person) {
//                    ForEach(employees) { employee in
//                        Text(employee.name)
//                            .tag(employee)
//                    }
//                }
                TextField("Asset Receipt Person", text: $asset.receipt_person)
            }
            Section("Asset Receipt Approver") {
                TextField("Asset Receipt Approver", text: $asset.approver)
            }
            Section("Others") {
                TextField("Others", text: $asset.addition)
            }
        }
        .navigationTitle("New Asset")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    network.recordAsset(id: asset.id, item_name: asset.item_name, item_quantity: asset.item_quantity, item_price: asset.item_price, item_sum_value: asset.item_sum_value, receipt_date: asset.receipt_date, receipt_department: asset.receipt_department, receipt_person: asset.receipt_person, approver: asset.approver, addition: asset.addition)
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        AssetInsert(asset: AssetToInsert(id: "1", item_name: "mbp8256", item_quantity: "1", item_price: "8999", item_sum_value: "8999", receipt_date: "2024-05-28", receipt_department: "it", receipt_person: "Alice", approver: "Admin", addition: ""))
    }
    .environmentObject(Network())
}
