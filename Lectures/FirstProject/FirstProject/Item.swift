//
//  Item.swift
//  FirstProject
//
//  Created by Kevin Yuen on 2024-01-08.
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
