//
//  GridView.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 10/11/25.
//

import SwiftUI

struct GridView: View {
    
    var seriesList: SeriesList = sharedData
    @State var selectedShow: Series? = nil
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(seriesList.series) { show in
                        
                        NavigationLink {
                            ShowDetailView(show: show)
                        } label: {
                            
                            Card(name: show.name)
                        }
                        
                        
                    }
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
    
    
}

struct Card: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Image(name).resizable().scaledToFit()
            
            let textName: String = name.replacingOccurrences(of: "-", with: " ")
            
            
            Text(textName).foregroundStyle(.black).lineLimit(1).truncationMode(.tail)
        }
    }
    
}
//

#Preview {
    GridView()
}
