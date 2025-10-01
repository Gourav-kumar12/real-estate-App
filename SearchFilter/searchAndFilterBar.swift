

import SwiftUI

struct searchAndFilterBar: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading){
                Text("Where To AnyWhere")
                    .font(.footnote)
                    .fontWeight(.semibold)
               
                    Text("AnyWhere - AnyWeek - Add guets")
                        .font(.caption2)
                        .foregroundStyle(.gray)
            }
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        
        .overlay{
            Capsule()
                .stroke(lineWidth:0.5)
                .foregroundStyle(.gray)
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
        
}

#Preview {
    searchAndFilterBar()
}

