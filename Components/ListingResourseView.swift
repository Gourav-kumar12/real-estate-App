

import SwiftUI

struct ListingResourseView: View {
    //populate
    let listing : Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageURLs, id:\.self){ image in
               Image(image)
                    .resizable()
                    .scaledToFit()
                   
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingResourseView(listing: DeveloperPreview.shared.listings[0])
}
