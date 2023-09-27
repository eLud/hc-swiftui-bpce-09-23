//
//  RestaurantController.swift
//  
//
//  Created by Ludovic Ollagnier on 22/06/2023.
//

import Fluent
import Vapor

struct RestaurantController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let resto = routes.grouped("restaurants")
        resto.get(use: index)
        resto.post(use: create)
        resto.group(":restaurantID") { resto in
            resto.delete(use: delete)
            resto.post("upload-image", use: uploadImage)
        }
    }

    func index(req: Request) async throws -> [Restaurant] {
        try await Restaurant.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Restaurant {
        let resto = try req.content.decode(Restaurant.self)

        try await resto.save(on: req.db)
        return resto
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let resto = try await Restaurant.find(req.parameters.get("restaurantID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await resto.delete(on: req.db)
        return .noContent
    }

    func uploadImage(req: Request) async throws -> Restaurant {
        let file = try req.content.decode(File.self)
        let path = req.application.directory.publicDirectory + file.filename
        try await req.fileio.writeFile(file.data, at: path)

        guard let resto = try await Restaurant.find(req.parameters.get("restaurantID"), on: req.db) else {
            throw Abort(.notFound)
        }

        let serverConfig = req.application.http.server.configuration
        let hostname = serverConfig.hostname
        let port = serverConfig.port

        resto.imageURL = URL(string: "http://\(hostname):\(port)/\(file.filename)")
        try await resto.update(on: req.db)

        return resto
    }
}
