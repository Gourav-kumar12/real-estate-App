import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel = ExploreViewModel(service: ExploreServices())
    
    var body: some View {
        TabView {
            ExploreHome()
                .environmentObject(viewModel) // state
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            Wishlist()
                .tabItem {
                    Label("Wishlist", systemImage: "heart")
                }
            
            PostView()
                .environmentObject(viewModel) // share state
                .tabItem {
                    Label("Post", systemImage: "plus.circle")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}


#Preview {
    MainTabView()
        .environmentObject(WishlistManager()) //share wishlist state
        .environmentObject(PostViewModel(service: ExploreServices()))

} 
