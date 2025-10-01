

import Foundation

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    var listings : [Listing] = [
        
        .init(
            id: NSUUID().uuidString,
            ownerUid:     NSUUID().uuidString,
            ownerName: "johan smith",
            ownerImageUrl: "male-profile.photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNights: 578,
            imageURLs: ["Image 1", "Image 2", "Image 3"],
            address: "124 main st ",
            city: "Miami",
            state: "Florida",
            title: "Maiami Villa",
            rating: 4.8,
            feature: [.selfCheckIn, .superHost],
            amenities: [.wifi ,.alarmSystem ,.laundry, .tv],
            type : .Villa
             
        ),
        
        .init(
            id: NSUUID().uuidString,
            ownerUid:     NSUUID().uuidString,
            ownerName: "stev johan",
            ownerImageUrl: "male-profile.photo",
            numberOfBedrooms: 3,
            numberOfBathrooms: 3,
            numberOfGuests: 6,
            numberOfBeds: 6,
            pricePerNights: 678,
            imageURLs: ["Image 3", "Image 1", "Image 3"],
            address: "184 round st ",
            city: "Los angles",
            state: "callifornia",
            title: "angles Villa",
            rating: 4.2,
            feature: [.selfCheckIn, .superHost],
            amenities: [.wifi ,.alarmSystem ,.laundry, .tv],
            type : .house
             
        ),
        
        .init(
            id: NSUUID().uuidString,
            ownerUid:     NSUUID().uuidString,
            ownerName: "johan smith",
            ownerImageUrl: "male-profile.photo",
            numberOfBedrooms: 6,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNights: 998,
            imageURLs: ["Image 4", "Image 1", "Image 2"],
            address: "124 main st ",
            city: "morren",
            state: "Florida",
            title: "morren Villa",
            rating: 4.9,
            feature: [.selfCheckIn, .superHost],
            amenities: [.wifi ,.alarmSystem ,.laundry, .tv],
            type : .Villa
             
        ),
        
        .init(
            id: NSUUID().uuidString,
            ownerUid:     NSUUID().uuidString,
            ownerName: "barlien smith",
            ownerImageUrl: "male-profile.photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNights: 578,
            imageURLs: ["Image 1", "Image 2", "Image 3"],
            address: "124 barlien st ",
            city: "brizel",
            state: "florida",
            title: "brizz Villa",
            rating: 5.2,
            feature: [.selfCheckIn, .superHost],
            amenities: [.wifi ,.alarmSystem ,.laundry, .tv],
            type : .apartment
             
        ),
        
        
        
    ]
}

