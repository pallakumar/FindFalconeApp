//
//  PlanetVehiclePicker.swift
//  FalconeAppPlanets
//
//  Created by apple on 05/07/25.
//

import SwiftUI

struct PlanetVehiclePicker: View {
    @EnvironmentObject var viewModel: FindFalconeViewModel
    var index: Int
    @State private var selectedPlanet: Planet?
    @State private var selectedVehicle: Vehicle?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Picker("Select Planet", selection: $selectedPlanet) {
                Text("-- Choose --").tag(Planet?.none)
                ForEach(viewModel.planets.filter { !viewModel.selectedPlanets.contains($0) }, id: \.self) { planet in
                    Text(planet.name).tag(Planet?.some(planet))
                }
            }
            .onChange(of: selectedPlanet) { _ in
                updateSelection()
            }
            .pickerStyle(MenuPickerStyle())

            if let planet = selectedPlanet {
                ForEach(viewModel.vehicles.filter { $0.max_distance >= planet.distance && $0.total_no > 0 }, id: \.name) { vehicle in
                    HStack {
                        RadioButton(isSelected: selectedVehicle?.name == vehicle.name) {
                            selectedVehicle = vehicle
                            updateSelection()
                        }
                        Text("\(vehicle.name) (\(vehicle.total_no) left)")
                    }
                }
            }
        }
    }

    func updateSelection() {
        guard let planet = selectedPlanet, let vehicle = selectedVehicle else { return }

        if viewModel.selectedPlanets.count > index {
            viewModel.selectedPlanets[index] = planet
            viewModel.selectedVehicles[index] = vehicle
        } else {
            viewModel.selectedPlanets.append(planet)
            viewModel.selectedVehicles.append(vehicle)
        }
        viewModel.updateTotalTime()
    }
}
