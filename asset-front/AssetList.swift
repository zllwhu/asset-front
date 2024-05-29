//
//  AssetList.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import SwiftUI
import Charts

struct AssetList: View {
    @EnvironmentObject var network: Network
    @State private var newAsset: AssetToInsert?
    
    var body: some View {
        VStack {
            NavigationSplitView {
                Group {
                    if !network.assets.isEmpty {
                        List {
                            ForEach(network.assets) { asset in
                                NavigationLink {
                                    AssetDetail(asset: asset)
                                } label: {
                                    Image(systemName: "\(asset.id).circle")
                                    Text(asset.item_name)
                                }
                            }
                        }
                        .deleteDisabled(true)
                    } else {
                        ContentUnavailableView {
                            Label("No Assets", systemImage: "pencil.and.ruler.fill")
                        }
                    }
                }
                .navigationTitle("Assets")
                .toolbar {
                    ToolbarItem {
                        Button(action: addAsset) {
                            Label("Add Asset", systemImage: "plus")
                        }
                    }
                    ToolbarItem {
                        Button(action: refreshList) {
                            Label("Refresh List", systemImage: "arrow.clockwise.circle")
                        }
                    }
                }
                .sheet(item: $newAsset) { asset in
                    NavigationStack {
                        AssetInsert(asset: asset)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    .interactiveDismissDisabled()
                }
                .onAppear() {
                    network.getAssets()
                }
            } detail: {
                Text("Select a asset")
                    .navigationTitle("Asset")
            }
        }
    }
    
    private func addAsset() {
        let newItem = AssetToInsert(id: "1", item_name: "mbp8256", item_quantity: "1", item_price: "8999", item_sum_value: "8999", receipt_date: "2024-05-28", receipt_department: "it", receipt_person: "Alice", approver: "Admin", addition: "")
        newAsset = newItem
    }
    
    private func refreshList() {
        network.getAssets()
    }
}

#Preview {
    AssetList()
        .environmentObject(Network())
}
