//
//  SectionHeader.swift
//  test-airbnb
//
//  Created by Gourav  on 30/09/25.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SectionHeader(title: "view")
}
