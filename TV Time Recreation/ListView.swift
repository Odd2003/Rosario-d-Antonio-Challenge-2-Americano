//
//  ListView.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 10/11/25.
//

import SwiftUI

struct ListView: View {
    
    var seriesList: SeriesList = sharedData
    
    let calendar = Calendar.current
    let today = Date()

    
    var body: some View {
        
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: today)?.start ?? today
        
        List {
            ForEach(0..<7, id: \.self) { i in
                
                let curDate = calendar.date(byAdding: .day, value: i, to: startOfWeek)
                
                Section {
                    
                    ForEach(seriesList.series) { show in
                        
                        if(show.dayOfRelease - 1 == i) {
                            HStack {
                                Image(show.name).resizable().scaledToFit().frame(height: 100)
                                let textName: String = show.name.replacingOccurrences(of: "-", with: " ")
                                
                                VStack(alignment: .leading) {
                                    Text(textName)
                                    Spacer()
                                    Text("S01 | \(show.watchedEpisodes + 1)")
                                }
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "checkmark.circle").font(.system(size: 40)).foregroundStyle(.black)
                                }
                                .buttonStyle(.plain)
                                
                            }
                        }
                        
                    }
                } header: {
                    
                    HStack {
                        Text(mapDays(num: i))
                        Spacer()
                        Text(curDate?.formatted(.dateTime.day().month().year()) ?? "").font(.title2).bold().foregroundStyle(.black)
                    }
                }
                
            }
        }
        
    }
    
    func mapDays(num: Int) -> String {
        
        switch(num) {
        case 0:
            return "Monday"
        case 1:
            return "Tuesday"
        case 2:
            return "Wednesday"
        case 3:
            return "Thursday"
        case 4:
            return "Friday"
        case 5:
            return "Saturday"
        case 6:
            return "Sunday"
        default: return ""
        }
    }

    
}


#Preview {
    ListView()
}
