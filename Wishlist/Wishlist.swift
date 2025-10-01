import SwiftUI

struct Wishlist: View {
    @EnvironmentObject var wishlistManager: WishlistManager
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if wishlistManager.wishlist.isEmpty {
                    Text("Your wishlist is empty ❤️")
                        .font(.headline)
                        .padding()
                } else {
                    List {
                        ForEach(wishlistManager.wishlist) { item in
                            HStack(spacing: 12) {
                                if let url = URL(string: item.image), item.image.hasPrefix("http") {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 80, height: 80)
                                        case .success(let image):
                                            image.resizable()
                                                .scaledToFill()
                                                .frame(width: 80, height: 80)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                                .foregroundColor(.gray)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Image(item.image.isEmpty ? "placeholder" : item.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.title)
                                        .font(.headline)
                                    Text(item.location)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(item.price)
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: deleteItems) // ✅ Swipe-to-delete
                    }
                }
            }
            .navigationTitle("Wishlist")
        }
    }
    
    // MARK: - Delete function
    private func deleteItems(at offsets: IndexSet) {
        wishlistManager.wishlist.remove(atOffsets: offsets)
        wishlistManager.saveWishlistDirect() 
    }
}
