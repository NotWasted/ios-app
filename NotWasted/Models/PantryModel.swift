//
//  PantryModel.swift
//  NotWasted
//
//  Created by admin on 30/06/21.
//

import Foundation

struct PantryModel: Codable {
    var items: [ItemModel]
}

struct ItemModel: Codable {
    var date: Date
    var description: String
    var discount: Double
    var price: Double
    var quantity: Double
    var total: Double
    var unitOfMeasure: String
    var weight: Double
    
    var productName: String
    
    var fsProductName: String
    var fsItemID: String
}
