//
//  TimelineView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 3/10/2024.
//

import SwiftUI

struct TimelineView: View {
    let newsItem: News
    let accent: Color

    @State private var selectedEvent: TimelineEvent?
    @State private var isShowingSheet = false

    var body: some View {
        VStack(alignment: .leading) {
            if newsItem.is_breaking_news {
                Label {
                    Text("Breaking")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                } icon: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                }
            }

            Text(newsItem.title)
                .font(.title)
                .fontWeight(.black)

            Divider()

            Label {
                Text("Timeline")
                    .font(.title3)
                    .fontWeight(.bold)
            } icon: {
                Image(systemName: "calendar.day.timeline.leading")
                    .foregroundColor(accent)
                    .imageScale(.large)
            }
            .padding(.top, 10)

            ForEach(newsItem.timeline.indices, id: \.self) { index in
                let tl = newsItem.timeline[index]

                HStack {
                    Label {
                        VStack(alignment: .leading) {
                            if let timelineDatetime = tl.getDatetime() {
                                Text(timelineDatetime)
                                    .font(.caption2)
                                    .bold()
                                    .foregroundStyle(.gray)
                            }

                            Text(tl.event)
                                .font(.footnote)
                        }
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .padding(10)
                        .background(accent.opacity(0.1))
                        .cornerRadius(10)
                    } icon: {
                        Image(systemName: "calendar.badge.clock")
                            .foregroundStyle(accent)
                            .imageScale(.small)
                    }
                    .labelStyle(CenteredLabelStyle())
                    .onTapGesture {
                        selectedEvent = tl
                    }
                }
                .overlay(alignment: .topLeading) {
                    if index < newsItem.timeline.count - 1 {
                        Rectangle()
                            .foregroundStyle(.gray.opacity(0.25))
                            .frame(width: 2, height: 69)
                            .offset(y: 43)
                            .padding(.leading, 7)
                    }
                }
                .frame(height: 80)
            }
        }
        .sheet(item: $selectedEvent) { event in
            EventDetailView(event: event, accent: accent)
                .presentationDetents([.medium, .fraction(0.40)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct EventDetailView: View {
    let event: TimelineEvent
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                if let datetime = event.getDatetime() {
                    Text(datetime)
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(.gray)
                }
            } icon: {
                Image(systemName: "calendar.badge.clock")
                    .foregroundStyle(accent)
                    .imageScale(.large)
            }

            Text(event.event)
                .font(.footnote)

            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding(.top, 30)
        .padding(.horizontal, 10)
        .navigationTitle("Event Details")
    }
}

#Preview("Breaking News") {
    TimelineView(
        newsItem: NewsData.sampleBreakingNewsList[0],
        accent: Color.red
    )
}

#Preview("Regular News") {
    TimelineView(
        newsItem: NewsData.sampleNewsList[0],
        accent: Color.green
    )
}
