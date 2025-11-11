//
//  GridView.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 10/11/25.
//

import SwiftUI

struct GridView: View {
    
    var seriesList: SeriesList = SeriesList()
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            
            ForEach(seriesList.series) { show in
                
                Card(name: show.name)
                
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct Card: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Image(name).resizable().scaledToFit()
            
            let textName: String = name.replacingOccurrences(of: "-", with: " ")
            
            Text(textName)
        }
    }
    
}


#Preview {
    GridView()
}
