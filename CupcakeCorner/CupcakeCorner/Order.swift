//
//  Order.swift
//  CupcakeCorner
//
//  Created by James Chun on 8/24/21.
//

import Foundation

//By creating the below struct I can comment out multiple lines in class Order
struct OrderItem: Codable {
    var type: Int = 0
    var quantity: Int = 3
    
    var extraFrosting: Bool = false
    var addSprinkles: Bool = false
    
    var name: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var zip: String = ""
    
}

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case order //type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var orderItem = OrderItem()
    
//    @Published var type = 0
//    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                orderItem.extraFrosting = false
                orderItem.addSprinkles = false
            }
        }
    }
//    @Published var extraFrosting = false
//    @Published var addSprinkles = false
//
//    @Published var name = ""
//    @Published var streetAddress = ""
//    @Published var city = ""
//    @Published var zip = ""
    
    var hasVaildAddress: Bool {
        if orderItem.name.trimmingCharacters(in: .whitespaces).isEmpty || orderItem.streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || orderItem.city.trimmingCharacters(in: .whitespaces).isEmpty || orderItem.zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(orderItem.quantity) * 2
        cost += Double(orderItem.type) / 2
        
        if orderItem.extraFrosting {
            cost += Double(orderItem.quantity)
        }
        
        if orderItem.addSprinkles {
            cost += Double(orderItem.quantity) / 2
        }
        
        return cost
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
        
        orderItem = try container.decode(OrderItem.self, forKey: .order)
    }//end of required init

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
//        try container.encode(type, forKey: .type)
//        try container.encode(quantity, forKey: .quantity)
//
//        try container.encode(extraFrosting, forKey: .extraFrosting)
//        try container.encode(addSprinkles, forKey: .addSprinkles)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(streetAddress, forKey: .streetAddress)
//        try container.encode(city, forKey: .city)
//        try container.encode(zip, forKey: .zip)
        
        try container.encode(orderItem, forKey: .order)
    }//end of func
    
    
}//End of class
