import SwiftUI

@main
struct TestAirbnbApp: App {
    
    @StateObject private var wishlistManager = WishlistManager()
    @StateObject private var postViewModel = PostViewModel(service: ExploreServices())
    
    var body: some Scene {
        WindowGroup {
            ICloudAccount()
                .environmentObject(wishlistManager)
                .environmentObject(postViewModel)
        }
    }
}
