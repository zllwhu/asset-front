//
//  AssetDetail.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import SwiftUI

struct AssetDetail: View {
    var asset: Asset
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var network: Network
    @State private var showAlert = false
    
    init(asset: Asset) {
        self.asset = asset
    }
    
    var body: some View {
        Form {
            Section("Asset ID") {
                Text("\(asset.id)")
            }
            Section("Asset Name") {
                Text(asset.item_name)
            }
            Section("Asset Quantity") {
                Text("\(asset.item_quantity)")
            }
            Section("Asset Price") {
                Text("\(asset.item_price)")
            }
            Section("Asset Sum Value") {
                Text("\(asset.item_sum_value)")
            }
            Section("Asset Receipt Date") {
                Text(asset.receipt_date)
            }
            Section("Asset Receipt Department") {
                Text(asset.receipt_department)
            }
            Section("Asset Receipt Person") {
                Text(asset.receipt_person)
            }
            Section("Asset Receipt Approver") {
                Text(asset.approver)
            }
            Section("Others") {
                Text(asset.addition)
            }
            Button("Remove This Asset", systemImage: "trash.slash") {
                showAlert = true
            }
            .foregroundColor(.red)
            .font(.headline).bold()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Attention"), message: Text("Confirm to remove this asset."), primaryButton: .destructive(Text("Remove"), action: deleteAsset), secondaryButton: .cancel())
            }
        }
        .navigationTitle("Asset Detail")
    }
    
    private func deleteAsset() {
        network.removeAsset(id: asset.id)
    }
}

#Preview {
    NavigationStack {
        AssetDetail(asset: Asset(id: 1, item_name: "mbp8256", item_quantity: 1, item_price: 8999, item_sum_value: 8999, receipt_date: "2024-05-28", receipt_department: "it", receipt_person: "Alice", approver: "Admin", addition: ""))
    }
    .environmentObject(Network())
}

#Preview {
    NavigationStack {
        AssetDetail(asset: Asset(id: 1, item_name: "mbp8256", item_quantity: 1, item_price: 8999, item_sum_value: 8999, receipt_date: "2024-05-28", receipt_department: "it", receipt_person: "Alice", approver: "Admin", addition: ""))
    }
    .environmentObject(Network())
}
