//
//  ContentView.swift
//  asset-front
//
//  Created by 赵路 on 2024/5/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AssetList()
                .tabItem {
                    Label("Assets", systemImage: "pencil.and.ruler.fill")
                }
            EmployeeList()
                .tabItem {
                    Label("Employee", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    ContentView()
}
