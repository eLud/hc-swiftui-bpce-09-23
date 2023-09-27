//
//  FouDeFoodWidget.swift
//  FouDeFoodWidget
//
//  Created by Ludovic Ollagnier on 29/06/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct FouDeFoodWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
//        Gauge(value: 0.2, label: {
            Text("Label")
//        })
        .gaugeStyle(.circular)
        .widgetCurvesContent()
        .widgetLabel("BlaBla")
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

@main
struct FouDeFoodWidget: Widget {

    @Environment(\.widgetFamily) var family

    let kind: String = "FouDeFoodWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            switch family {
            case .accessoryCircular:
                FouDeFoodWidgetEntryView(entry: entry)
            default:
                FouDeFoodWidgetEntryView(entry: entry)
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .accessoryCircular) {
    FouDeFoodWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
