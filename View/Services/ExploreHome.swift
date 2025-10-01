import SwiftUI

struct ExploreHome: View {
    
    @State private var DestinationSearchView = false
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var postViewModel: PostViewModel  
    
    var body: some View {
        NavigationStack {
            if DestinationSearchView {
                showDestinationSearchView(show: $DestinationSearchView)
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // MARK: - Search Bar
                        searchAndFilterBar()
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    DestinationSearchView.toggle()
                                }
                            }
                            .padding(.horizontal)
                        
                        // MARK: - Categories
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 24) {
                                NavigationLink(destination: HomeTab()) {
                                    CategoryItem(icon: "house.fill", title: "Homes")
                                }
                                .foregroundStyle(.black)
                                
                                NavigationLink(destination: HomeTab()) {
                                    CategoryItem(icon: "balloon.fill", title: "Experiences")
                                }
                                .foregroundStyle(.black)
                                
                                NavigationLink(destination: HomeTab()) {
                                    CategoryItem(icon: "book.fill", title: "Services")
                                }
                                .foregroundStyle(.black)
                            }
                            .padding(.horizontal)
                        }
                        
                        // MARK: - Continue Searching Card
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Continue searching for hairstylists")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("in London")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image("Image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        .padding(.horizontal)
                        
                        
                        // MARK: - Recently Viewed Homes
                        SectionHeader(title: "Recently viewed homes")
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(DeveloperPreview.shared.listings.prefix(5)) { listing in
                                    NavigationLink {
                                        ListingDetailView(listing: listing)
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        ListingItemView(listing: listing, sectionKey: "recent")
                                            .frame(width: 200, height: 250)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // MARK: - Stay near Wembley Stadium
                        SectionHeader(title: "Stay near Wembley Stadium")
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(DeveloperPreview.shared.listings.prefix(5)) { listing in
                                    NavigationLink {
                                        ListingDetailView(listing: listing)
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        ListingItemView(listing: listing, sectionKey: "wembley")
                                            .frame(width: 260, height: 320)
                                            .clipShape(RoundedRectangle(cornerRadius: 14))
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // MARK: - Post Properties
                        if !postViewModel.listings.filter({ $0.isUserPost == true }).isEmpty {
                            SectionHeader(title: "Post Properties")
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(postViewModel.listings.filter { $0.isUserPost == true }) { listing in
                                        NavigationLink {
                                            ListingDetailView(listing: listing)
                                                .navigationBarBackButtonHidden()
                                        } label: {
                                            ListingItemView(listing: listing, sectionKey: "userpost")
                                                .frame(width: 220, height: 280)
                                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Explore")
                .navigationBarHidden(true)
            }
        }
    }
}

// MARK: - Category Item
struct CategoryItem: View {
    let icon: String
    let title: String
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 26))
                .frame(width: 56, height: 56)
                .background(Color.gray.opacity(0.12))
                .clipShape(Circle())
            Text(title)
                .font(.footnote)
        }
    }
}

#Preview {
    ExploreHome()
        .environmentObject(WishlistManager())
        .environmentObject(PostViewModel(service: ExploreServices()))
}
