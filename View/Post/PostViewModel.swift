// PostViewModel.swift
import Foundation
import Combine

@MainActor
class PostViewModel: ObservableObject {
    
    @Published private(set) var listings: [Listing] = []

    private var userListings: [Listing] = []

    private let storageKey = "user_posts_v1"

    
    init(service: ExploreServices = ExploreServices()) {
        loadUserPosts()
    }

    // Add a new user post
    func addListing(_ listing: Listing) {
        var new = listing
        new.isUserPost = true
        userListings.append(new)
        syncListingsAndSave()
    }

    // Optional: remove a user post by id
    func removeUserListing(withId id: String) {
        if let idx = userListings.firstIndex(where: { $0.id == id }) {
            userListings.remove(at: idx)
            syncListingsAndSave()
        }
    }

    // MARK: - Persistence / sync helpers

    private func syncListingsAndSave() {
        
        // Merge default preview listings + user posts
        listings = DeveloperPreview.shared.listings + userListings
        saveUserPosts()
    }

    private func saveUserPosts() {
        do {
            let encoded = try JSONEncoder().encode(userListings)
            UserDefaults.standard.set(encoded, forKey: storageKey)
        } catch {
            print("PostViewModel: failed to encode user posts:", error)
        }
    }

    private func loadUserPosts() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            // no saved user posts — show defaults
            listings = DeveloperPreview.shared.listings
            return
        }

        do {
            let decoded = try JSONDecoder().decode([Listing].self, from: data)
            userListings = decoded
        } catch {
            print("PostViewModel: failed to decode saved posts:", error)
            userListings = []
        }

        listings = DeveloperPreview.shared.listings + userListings
    }
}
