//
//  HomeCard.swift
//  test-airbnb
//
//  Created by Gourav  on 30/09/25.
//

import SwiftUI

struct HomeCard: View {
    let image: String
    let location: String
    let details: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 160, height: 120)
                
                Image(systemName: "heart")
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding(6)
            }
            Text(location)
                .fontWeight(.semibold)
            Text(details)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 160)
    }
}


#Preview {
    HomeCard(image: "bed.fill", location: "london", details: "4.5*")
}
