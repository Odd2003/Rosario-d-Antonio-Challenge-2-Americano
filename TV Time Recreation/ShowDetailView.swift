//
//  ShowDetailView.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 12/11/25.
//

import SwiftUI

struct ShowDetailView: View {
    
    enum DetailSelection: String, CaseIterable {
            case first = "Details"
            case second = "Seasons"
    }

    @State private var selection: DetailSelection = .first

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
                .frame(height: 190)
                .ignoresSafeArea()
                
                
                let textName: String = show.name.replacingOccurrences(of: "-", with: " ")
                
                Text(textName).font(.system(size: 30)).bold().padding(.leading, 15)
           
                Picker("Select a view", selection: $selection) {
                    ForEach(DetailSelection.allCases, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 5)
                
                switch selection {
                case .first:
                    Text("Trama:").bold().padding(.top, 5).padding(.horizontal)
                    ScrollView {
                        
                        Text(show.description)
                    }.padding(.horizontal)
                case .second:
                    SeasonsView(show: show)
                }
                Spacer()
                
            }
//            Image(show.name).resizable().aspectRatio(contentMode: .fill).mask (
//                Rectangle().frame(height: 200).padding(.bottom, 200)
//            ).clipped()
//            Text(show.name)
        }
    }
}

struct SeasonsView: View {
    
    @State var show: Series?
    
    @State var expanded: [Bool]
    
    init(show: Series?) {
        self.show = show
        
        self._expanded = State(initialValue: Array(repeating: false, count: show!.episodes.count))
        
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.yellow)
    }
    
    var body: some View {
        
        if let show {
            
            List {
                
                ForEach(0..<show.seasons, id: \.self) { index in
                    Section {
                        DisclosureGroup(isExpanded: $expanded[index]) {
                            ForEach(0..<show.episodes[index], id: \.self) { item in
                            
                                HStack {
                                    Text("Episode \(item + 1)")
                                    
                                    if(isEpisodeWatched(show: show, seasonIndex: index, episodeIndex: item)) {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        } label: {
                            Text("Season \(index + 1):")
                        }
                    }
                }
                
            }.ignoresSafeArea()
        }
    }
    
    func isEpisodeWatched(show: Series?, seasonIndex: Int, episodeIndex: Int) -> Bool {
        if let show {
            // Step 1: count episodes before this season
            let episodesBeforeSeason = show.episodes.prefix(seasonIndex).reduce(0, +)
            
            // Step 2: convert episode position to global episode number
            let episodeNumber = episodesBeforeSeason + episodeIndex + 1
            
            // Step 3: compare
            return episodeNumber <= show.watchedEpisodes
        }
        return false
    }
}


#Preview {
    ContentView()
}
