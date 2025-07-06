//
//  FalconeService.swift
//  FalconeAppPlanets
//
//  Created by Palla Kumar on 04/07/25.
//

import SwiftUI
import Foundation

struct Planet: Codable, Equatable, Hashable {
    let name: String
    let distance: Int
}

struct Vehicle: Codable, Equatable, Hashable {
    let name: String
    var total_no: Int
    let max_distance: Int
    let speed: Int
}

struct TokenResponse: Codable {
    let token: String
}

struct FindRequest: Codable {
    let token: String
    let planet_names: [String]
    let vehicle_names: [String]
}

struct FindResponse: Codable {
    let planet_name: String?
    let status: String
}

class FalconeService {
    static let shared = FalconeService()
    private init() {}

    private let baseURL = "https://findfalcone.geektrust.com"

    func getPlanets(completion: @escaping ([Planet]?) -> Void) {
        let url = URL(string: "\(baseURL)/planets")!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let planets = try? JSONDecoder().decode([Planet].self, from: data)
                completion(planets)
            } else {
                completion(nil)
            }
        }.resume()
    }

    func getVehicles(completion: @escaping ([Vehicle]?) -> Void) {
        let url = URL(string: "\(baseURL)/vehicles")!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let vehicles = try? JSONDecoder().decode([Vehicle].self, from: data)
                completion(vehicles)
            } else {
                completion(nil)
            }
        }.resume()
    }

    func getToken(completion: @escaping (String?) -> Void) {
        var request = URLRequest(url: URL(string: "\(baseURL)/token")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                let tokenResponse = try? JSONDecoder().decode(TokenResponse.self, from: data)
                completion(tokenResponse?.token)
            } else {
                completion(nil)
            }
        }.resume()
    }

    func findFalcone(token: String, planetNames: [String], vehicleNames: [String], completion: @escaping (FindResponse?) -> Void) {
        var request = URLRequest(url: URL(string: "\(baseURL)/find")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload = FindRequest(token: token, planet_names: planetNames, vehicle_names: vehicleNames)
        request.httpBody = try? JSONEncoder().encode(payload)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                let response = try? JSONDecoder().decode(FindResponse.self, from: data)
                completion(response)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
