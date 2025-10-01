

import Foundation


struct Listing :Identifiable, Codable, Hashable {
    
    let id : String
    let ownerUid : String
    let ownerName : String
    let ownerImageUrl : String
    let numberOfBedrooms : Int
    let numberOfBathrooms : Int
    let numberOfGuests : Int
    let numberOfBeds : Int
    let pricePerNights : Int
    let imageURLs :[String]
    let address : String
    let city : String
    let state : String
    let title : String
    let rating : Double
    var feature : [ListingFeatures]
    var amenities : [ListingAmenities]
    var type : ListingType
    
    var isUserPost: Bool = false
}


//make enum

enum ListingFeatures : Int, Codable, Identifiable, Hashable {
    
    case selfCheckIn
    case superHost
    
    //image name
    var imageName : String{
        
        switch self {
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
    
    //title name
    var title : String{
        
        switch self {
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }
    
    //subtitle
    var subtitle : String{
        switch self{
        case .selfCheckIn:
            return "Check your self in the keypad"
        case .superHost:
            return "This host is a Superhost"
        }
    }
    
    //return rawvalue
    var id : Int {
        return self.rawValue
    }
}


enum ListingAmenities : Int, Codable, Identifiable, Hashable {
    
    //that is define raw data/value
    case pool
    case kitchen
    case parking
    case laundry
    case wifi
    case tv
    case alarmSystem
    case office
    
    
    var title : String {
        switch self {
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .parking:
            return "Parking"
        case .laundry:
            return "Laundry"
        case .wifi:
            return "Wifi"
        case .tv:
            return "Tv"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
            
        }
   
    }
    
    
    var imageName : String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .parking:
            return "Parking"
        case .laundry:
            return "washer"
        case .wifi:
            return "wifi"
        case .tv:
            return "tv"
        case.alarmSystem:
            return "checkerboard.shield"
        case .office:
            return "pencil.and.ruler.fill"
            
            
        }
    }
    
    
    var id : Int  { return
        self.rawValue
    }
        
}

enum ListingType : Int, Codable, Identifiable, Hashable {
    
    case apartment
    case house
    case townhouse
    case Villa
    
    var description : String {
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townhouse:
            return "Town house"
        case .Villa:
            return "Villa"
        }
    }
    
    var id : Int  { return
        self.rawValue
    }
    
}
   
