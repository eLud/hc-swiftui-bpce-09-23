//
//  File.swift
//  
//
//  Created by Ludovic Ollagnier on 22/06/2023.
//

import Fluent

struct CreateRestaurant: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("restaurant")
            .id()
            .field("name", .string, .required)
            .field("address", .string, .required)
            .field("restaurantType", .string, .required)
            .field("foodStyle", .string, .required)
            .field("imageURL", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("restaurant").delete()
    }
}
