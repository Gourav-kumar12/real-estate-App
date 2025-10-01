//
//  MessageView.swift
//  test-airbnb
//
//  Created by Gourav  on 30/09/25.
//

import SwiftUI

struct MessageDetailView: View {
    let message: Message
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "a.circle.fill") // Airbnb logo placeholder
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.black)
                .padding(.top, 40)
            
            Text(message.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(message.subtitle)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text("Status: \(message.status)")
                .font(.subheadline)
            
            Text("Date: \(message.date)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Message")
        .navigationBarTitleDisplayMode(.inline)
    }
}
