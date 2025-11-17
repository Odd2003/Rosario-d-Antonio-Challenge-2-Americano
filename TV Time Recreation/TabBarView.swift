//
//  TabBarView.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 12/11/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            Tab("Shows", systemImage: "tv") {
               ContentView()
            }

            Tab("Movies", systemImage: "movieclapper") {
                Text("View not implemented")
            }

            Tab("Discover", systemImage: "magnifyingglass") {
                Text("View not implemented")
            }
            
            Tab("Profile", systemImage: "person.crop.circle") {
                Text("View not implemented")
            }
        
        }
        .tint(.yellow)
        
    }
}

#Preview {
    TabBarView()
}
