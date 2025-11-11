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
            case first = "First"
            case second = "Second"
        }

    @State private var selection: ViewSelection = .first
    
    let segments = ["First", "Second"]
    
    var body: some View {
        
        Picker("Select a view", selection: $selection) {
                        ForEach(ViewSelection.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
       
        switch selection {
        case .first:
            GridView()
        case .second:
            Color(.blue)
        }
        
    }
}

#Preview {
    ContentView()
}
