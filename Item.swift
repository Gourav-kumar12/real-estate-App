//
//  Item.swift
//  test-airbnb
//
//  Created by Gourav  on 29/09/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
