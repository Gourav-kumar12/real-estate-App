
import Foundation

class ExploreServices{
    
    func fetchListing() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
