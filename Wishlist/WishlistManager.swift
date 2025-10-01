import Foundation
import Combine

struct WishlistItem: Codable, Identifiable, Equatable {
    var id: String
    var title: String
    var location: String
    var price: String
    var image: String
}

class WishlistManager: ObservableObject {
    @Published var wishlist: [WishlistItem] = []
    
    fileprivate let key = "wishlist_items"
    
    init() {
        loadWishlist()
    }
    
    func toggleWishlist(for item: WishlistItem) {
        if let index = wishlist.firstIndex(of: item) {
            wishlist.remove(at: index)
        } else {
            wishlist.append(item)
        }
        saveWishlist()
    }
    
    func isWishlisted(_ item: WishlistItem) -> Bool {
        return wishlist.contains(item)
    }
    
    fileprivate func saveWishlist() {
        if let encoded = try? JSONEncoder().encode(wishlist) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    private func loadWishlist() {
        if let saved = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([WishlistItem].self, from: saved) {
            wishlist = decoded
        }
    }
}

extension WishlistManager {
    func saveWishlistDirect() {
        if let encoded = try? JSONEncoder().encode(wishlist) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
