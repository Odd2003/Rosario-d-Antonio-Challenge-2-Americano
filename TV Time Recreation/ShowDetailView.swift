//
//  ShowDetailView.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 12/11/25.
//

import SwiftUI

struct ShowDetailView: View {
    
    @State var show: Series?
    
    var body: some View {
        if let show {
            VStack(alignment: .leading) {
                GeometryReader { geo in
                    Image(show.name)
                        .resizable()                   // allow scaling
                        .scaledToFill()                // fill the rectangle while preserving aspect ratio
                        .frame(width: geo.size.width, height: 300) // horizontal rectangle
                        .offset(y: 100)
                        .clipped()                     // crop overflow
                        
                }
                .frame(height: 300)
                .ignoresSafeArea()
                
                
                let textName: String = show.name.replacingOccurrences(of: "-", with: " ")
                
                Text(textName).font(.system(size: 30)).bold().padding(.top, -110).padding(.leading, 15)
                Spacer()
            }
//            Image(show.name).resizable().aspectRatio(contentMode: .fill).mask (
//                Rectangle().frame(height: 200).padding(.bottom, 200)
//            ).clipped()
//            Text(show.name)
        }
    }
}

#Preview {
    ContentView()
}
