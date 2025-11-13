//
//  ContentView.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 07/11/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    enum ViewSelection: String, CaseIterable {
            case first = "Watch List"
            case second = "Upcoming"
    }

    @State private var selection: ViewSelection = .first

    
    var body: some View {
        
        NavigationStack{
            Picker("Select a view", selection: $selection) {
                ForEach(ViewSelection.allCases, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.segmented)
            .padding(5)
            
            switch selection {
            case .first:
                GridView()
            case .second:
                ListView()
            }
        }
    }
}

#Preview {
    ContentView()
}
