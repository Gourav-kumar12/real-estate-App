//
//  Messages.swift
//  test-airbnb
//
//  Created by Gourav  on 29/09/25.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let status: String
    let date: String
}

enum MessageFilter: String, CaseIterable {
    case all = "All"
    case travelling = "Travelling"
    case support = "Support"
}

struct Messages: View {
    @State private var selectedFilter: MessageFilter = .all
    
    let allMessages: [Message] = [
        Message(title: "Airbnb Support", subtitle: "Open to see the latest messages", status: "Closed", date: "Yesterday"),
        Message(title: "Airbnb Support", subtitle: "Open to see the latest messages", status: "Ongoing", date: "Fri"),
        Message(title: "Airbnb Support", subtitle: "Open to see the Best price for you 50% discount ", status: "current", date: "Mon")
    ]
    
    var filteredMessages: [Message] {
        switch selectedFilter {
        case .all:
            return allMessages
        case .travelling:
            return allMessages.filter { $0.status == "Ongoing" }
        case .support:
            return allMessages.filter { $0.status == "Closed" }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // Top Title
                Text("Messages")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Segmented Tabs
                HStack {
                    ForEach(MessageFilter.allCases, id: \.self) { filter in
                        Button(action: {
                            selectedFilter = filter
                        }) {
                            Text(filter.rawValue)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(selectedFilter == filter ? Color.black : Color.gray.opacity(0.2))
                                .foregroundColor(selectedFilter == filter ? .white : .black)
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Message List with Navigation
                List(filteredMessages) { message in
                    NavigationLink(destination: MessageDetailView(message: message)) {
                        HStack {
                            Image(systemName: "a.circle.fill") // Placeholder Airbnb logo
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(message.title)
                                    .fontWeight(.semibold)
                                Text(message.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(message.status)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Text(message.date)
                                .font(.footnote)
                                .foregroundColor(.gray)
                    }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}


#Preview {
    Messages()
}
