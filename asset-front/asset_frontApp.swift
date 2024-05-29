//
//  asset_frontApp.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import SwiftUI
import SwiftData

@main
struct asset_frontApp: App {
    var network = Network()
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: AssetToInsert.self, Employee.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
                .modelContainer(modelContainer)
        }
    }
}
