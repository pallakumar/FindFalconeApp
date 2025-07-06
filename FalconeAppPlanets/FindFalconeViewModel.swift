//
//  FindFalconeViewModel.swift
//  FalconeAppPlanets
//
//  Created by apple on 05/07/25.
//

import SwiftUI
import Foundation

class FindFalconeViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @Published var vehicles: [Vehicle] = []
    @Published var selectedPlanets: [Planet] = []
    @Published var selectedVehicles: [Vehicle] = []
    @Published var totalTime: Double = 0
    @Published var result: String?

    func fetchData() {
        FalconeService.shared.getPlanets { [weak self] planets in
            DispatchQueue.main.async {
                self?.planets = planets ?? []
            }
        }

        FalconeService.shared.getVehicles { [weak self] vehicles in
            DispatchQueue.main.async {
                self?.vehicles = vehicles ?? []
            }
        }
    }

    func findFalcone() {
        FalconeService.shared.getToken { token in
            guard let token = token else { return }
            let planetNames = self.selectedPlanets.map { $0.name }
            let vehicleNames = self.selectedVehicles.map { $0.name }

            FalconeService.shared.findFalcone(token: token, planetNames: planetNames, vehicleNames: vehicleNames) { response in
                DispatchQueue.main.async {
                    if let response = response {
                        if response.status == "success", let planet = response.planet_name {
                            self.result = "Found on \(planet)"
                        } else {
                            self.result = "Not found"
                        }
                    } else {
                        self.result = "Error finding Falcone"
                    }
                }
            }
        }
    }

    func updateTotalTime() {
        totalTime = zip(selectedPlanets, selectedVehicles).reduce(0) { total, pair in
            total + Double(pair.0.distance) / Double(pair.1.speed)
        }
    }
}
