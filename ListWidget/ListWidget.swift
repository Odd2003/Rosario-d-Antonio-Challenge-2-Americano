//
//  ListWidget.swift
//  ListWidget
//
//  Created by Rosario d'Antonio on 11/11/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), series: sharedData)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), series: sharedData)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, series: sharedData)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let series: SeriesList
}

struct ListWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry
    let calendar = Calendar.current
   
    var body: some View {
        let today = calendar.component(.weekday, from: entry.date)
        let adjustedToday = today == 1 ? 7 : today - 1 // convert Sunday=1 to 7
        
        // Sort shows starting from today
        var firstSortedShows = entry.series.series.sorted { show1, show2 in
            // Distance from today
            let distance1 = (show1.dayOfRelease - adjustedToday + 7) % 7
            let distance2 = (show2.dayOfRelease - adjustedToday + 7) % 7
            return distance1 < distance2
        }
        
        let sortedShows = firstSortedShows.filter{!$0.isFinished()}
        
        switch family {
        case .systemMedium:
            ZStack {
                RoundedRectangle(cornerRadius: 10).frame(height: 25).foregroundStyle(.yellow)
                Text("Upcoming Shows").bold().font(.system(size: 14))
            }
            
            HStack {
                VStack(alignment: .leading) {
                    ForEach(sortedShows.prefix(3)) { show in
                        
                        HStack() {
                            
                            Image(show.name).resizable().scaledToFit()
                            
                            let textName: String = show.name.replacingOccurrences(of: "-", with: " ")
                            
                            Text(textName).font(.system(size: 12))
                            Spacer()
                            Text(mapDays(num: show.dayOfRelease - 1)).font(.system(size: 12))
                        }
                        
                        
                    }
                }
                Spacer()
            }
        case .systemLarge:
            ZStack {
                RoundedRectangle(cornerRadius: 10).ignoresSafeArea().frame(height: 40).foregroundStyle(.yellow)
                Text("Upcoming Shows").bold()
            }.padding(.bottom, 15)
            
            
            HStack {
                VStack(alignment: .leading) {
                    ForEach(sortedShows.prefix(5)) { show in
                        if let encodedTitle = show.name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
                           let url = URL(string: "myapp://series/\(encodedTitle)") {
                            Link(destination: url) {
                                HStack() {
                                    
                                    Image(show.name).resizable().scaledToFit()
                                    
                                    let textName: String = show.name.replacingOccurrences(of: "-", with: " ")
                                    
                                    VStack(alignment: .leading) {
                                        Text(textName)
                                        let tuple = findSeason(show: show)
                                        
                                        Text("S\(String(format: "%02d", tuple.0)) | E\(String(format: "%02d", tuple.1 + 1))").font(.system(size: 14))
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        
                                        Text(mapDays(num: show.dayOfRelease - 1))
                                        if let weekDay = nextWeekdayString(show.dayOfRelease) {
                                            Text(weekDay).font(.system(size: 12))
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                }
                Spacer()
                
            }
            
        default: Text("Family not supported")
        }
        
        HStack {
            Text("...more").foregroundStyle(.gray)
            Spacer()
        }
        
    }
    
    func findSeason(show: Series) -> (Int, Int) {
        var i = 1
        var totalEps = 0
        for episodesWatchedInSeason in show.episodes {
            totalEps += episodesWatchedInSeason
            if(show.watchedEpisodes < totalEps) {
                return (i, show.watchedEpisodes - totalEps + episodesWatchedInSeason)
            }
            i += 1
        }
        return (0, 0)
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
    
    func nextWeekdayString(_ isoWeekday: Int, from date: Date = Date()) -> String? {
        guard (1...7).contains(isoWeekday) else { return nil }
            
            let calendar = Calendar.current
            
            // Map ISO weekday (1 = Monday, 7 = Sunday) to Calendar weekday (1 = Sunday, 2 = Monday, ..., 7 = Saturday)
            let calendarWeekday = isoWeekday % 7 + 1
            
            let todayWeekday = calendar.component(.weekday, from: date)
            
            let targetDate: Date
            if todayWeekday == calendarWeekday {
                // Today is the target weekday
                targetDate = date
            } else {
                // Find the next occurrence
                targetDate = calendar.nextDate(
                    after: date,
                    matching: DateComponents(weekday: calendarWeekday),
                    matchingPolicy: .nextTimePreservingSmallerComponents
                )!
            }
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "d MMMM"
            
            return formatter.string(from: targetDate)
    }
}

struct ListWidget: Widget {
    let kind: String = "ListWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ListWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ListWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemLarge) {
    ListWidget()
} timeline: {
    SimpleEntry(date: .now, series: sharedData)
    SimpleEntry(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, series: sharedData)
}
