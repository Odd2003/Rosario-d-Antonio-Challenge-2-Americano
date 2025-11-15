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
    
    var hasFinisedShows = sharedData.checkForFinshed()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    Section {
                        ForEach(seriesList.series) { show in
                            
                            if(!show.isFinished()) {
                                NavigationLink {
                                    ShowDetailView(show: show)
                                } label: {
                                    
                                    Card(show: show, color: .yellow)
                                }
                            }
                            
                        }
                    } header: {
                        ZStack {
                            Capsule().foregroundStyle(Color(uiColor: .lightGray)).frame(width: 140, height: 30)
                            Text("Watchlist").font(.system(size: 17, weight: .heavy))
                        }
                    }
                    if(hasFinisedShows) {
                        Section {
                            
                            ForEach(seriesList.series) { show in
                                
                                if(show.isFinished()) {
                                    NavigationLink {
                                        ShowDetailView(show: show)
                                    } label: {
                                        
                                        Card(show: show, color: .purple)
                                    }
                                }
                            }
                        } header: {
                            ZStack {
                                Capsule().foregroundStyle(Color(uiColor: .lightGray)).frame(width: 140, height: 30)
                                Text("Completed").font(.system(size: 17, weight: .heavy))
                            }
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
    
    var show: Series
    var color: Color
    
    var body: some View {
        VStack {
            Image(show.name).resizable().scaledToFit()
            
            let textName: String = show.name.replacingOccurrences(of: "-", with: " ")
            
            ZStack {
                GeometryReader { geo in
                        let fullWidth = geo.size.width
                    let totalEpisodes = show.episodes.reduce(0, +)
                    let progress = CGFloat(show.watchedEpisodes) / CGFloat(totalEpisodes)

                        // Background bar
                        Rectangle()
                        .fill(Color(red: 0.8, green: 0.8, blue: 0.8))
                            .frame(height: 25)

                        // Progress bar (uses %, not hard-coded width)
                        Rectangle()
                            .fill(color)
                            .frame(width: fullWidth * progress, height: 25)

                        // Text
                        Text(textName)
                            .foregroundStyle(.black)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .frame(width: fullWidth, height: 25).bold()
                }.frame(height: 25)
                
                
            }.padding(.top, -8)
        }
    }
    
}
//

#Preview {
    ContentView()
}
