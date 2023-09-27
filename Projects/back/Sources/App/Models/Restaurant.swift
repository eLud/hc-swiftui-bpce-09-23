//
//  File.swift
//  
//
//  Created by Ludovic Ollagnier on 22/06/2023.
//

import Fluent
import Vapor

final class Restaurant: Model, Content {

    static let schema = "restaurant"

    enum RestaurantType: String, Codable {
        case takeAway
        case onSite
        case both
    }

    enum FoodStyle: String, Codable {
        case japanese
        case indian
        case european
        case italian
        case burger
    }

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "address")
    var address: String

    @Field(key: "restaurantType")
    var restaurantType: RestaurantType

    @Field(key: "foodStyle")
    var foodStyle: FoodStyle

    @OptionalField(key: "imageURL")
    var imageURL: URL?

    init() { }

    init(id: UUID? = nil, name: String, address: String, restaurantType: Restaurant.RestaurantType, foodStyle: Restaurant.FoodStyle) {
        self.id = id
        self.name = name
        self.address = address
        self.restaurantType = restaurantType
        self.foodStyle = foodStyle
    }

}
