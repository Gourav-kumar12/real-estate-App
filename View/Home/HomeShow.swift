import SwiftUI

struct HomeShow: View {
    let title: String
    let subtitle: String
    let price: String
    let location: String
    let image: String
    
    @EnvironmentObject var wishlistManager: WishlistManager
    @State private var showPopup = false
    @State private var popupMessage = ""
    
    var body: some View {
        let wishlistItem = WishlistItem(
            id: UUID().uuidString, // or use title+location as a unique key
            title: title,
            location: location,
            price: price,
            image: image
        )
        
        ZStack(alignment: .topTrailing) {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(price)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text(location)
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .foregroundColor(.white)
                        .background(.blue.opacity(0.6))
                        .clipShape(Capsule())
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 5)
            
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
            .padding(8)
        }
        .overlay(
            Group {
                if showPopup {
                    Text(popupMessage)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.8))
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
