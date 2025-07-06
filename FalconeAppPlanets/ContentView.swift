//  FindFalconeApp.swift
//  FindFalcone

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FindFalconeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<4, id: \.self) { index in
                        PlanetVehiclePicker(index: index)
                            .environmentObject(viewModel)
                    }

                    Text("Total Time: \(viewModel.totalTime, specifier: "%.2f")")
                        .padding(.top)

                    Button("Find Falcone") {
                        viewModel.findFalcone()
                    }
                    .disabled(viewModel.selectedPlanets.count < 4 || viewModel.selectedVehicles.count < 4)
                    .padding()

                    if let result = viewModel.result {
                        Text("Result: \(result)")
                            .font(.headline)
                            .foregroundColor(result.contains("Found") ? .green : .red)
                            .padding()
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchData()
            }
            .navigationBarTitle("Find Falcone")
        }
    }
}
