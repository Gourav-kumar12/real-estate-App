import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var sectionKey: String = ""
    
    @EnvironmentObject var wishlistManager: WishlistManager
    @State private var showPopup = false
    @State private var popupMessage = ""

    var body: some View {
        // Save property image, fallback to owner image if empty
        let wishlistItem = WishlistItem(
            id: sectionKey + "_" + String(describing: listing.id),
            title: "\(listing.city), \(listing.state)",
            location: listing.state,
            price: "$\(listing.pricePerNights)",
            image: listing.imageURLs.first ?? listing.ownerImageUrl
        )

        VStack {
            ZStack(alignment: .topTrailing) {
                // Show main property image
                if let firstImage = listing.imageURLs.first {
                    Image(firstImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image(listing.ownerImageUrl) // fallback to profile image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                // ❤️ Button
                Button {
                    wishlistManager.toggleWishlist(for: wishlistItem)
                    if wishlistManager.isWishlisted(wishlistItem) {
                        popupMessage = "✅ Added to wishlist"
                    } else {
                        popupMessage = "❌ Removed from wishlist"
                    }
                    withAnimation(.spring()) { showPopup = true }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.spring()) { showPopup = false }
                    }
                } label: {
                    Image(systemName: wishlistManager.isWishlisted(wishlistItem) ? "heart.fill" : "heart")
                        .foregroundColor(wishlistManager.isWishlisted(wishlistItem) ? .red : .white)
                        .padding(8)
                        .background(Color.black.opacity(0.5))
                        .clipShape(Circle())
                }
                .padding(10)
            }

            // Details
            HStack {
                VStack(alignment: .leading) {
                    Text(wishlistItem.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text(wishlistItem.price)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        .padding()
        .overlay(
            Group {
                if showPopup {
                    Text(popupMessage)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.85))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .padding(.top, -10)
                }
            },
            alignment: .top
        )
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0], sectionKey: "recent")
        .environmentObject(WishlistManager())
}
