//
//  StayCard.swift
//  test-airbnb
//
//  Created by Gourav  on 30/09/25.
//

import SwiftUI

struct StayCard: View {
    let image: String
    let title: String
    let details: String
    let price: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 200, height: 120)
                .overlay(
                    Image(systemName: image)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                )
            
            Text(title)
                .fontWeight(.semibold)
            Text(details)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(price)
                .font(.footnote)
        }
        .frame(width: 200)
    }
}


