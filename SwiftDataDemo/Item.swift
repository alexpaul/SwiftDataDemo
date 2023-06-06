//
//  Item.swift
//  SwiftDataDemo
//
//  Created by Alex Paul on 6/5/23.
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
