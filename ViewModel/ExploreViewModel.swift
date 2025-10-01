
import Foundation
import Combine

class ExploreViewModel: ObservableObject {
    @Published var  listings = [Listing] ()
    private let service : ExploreServices
    
    init(service : ExploreServices){
        self.service = service
        
        Task{
            await fetchListings()
        }
    }
    //initialized function main work fetchListings
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListing()
        }
        catch {
            print(" debug : Error fetching listings: \(error)")
        }
    }
}
