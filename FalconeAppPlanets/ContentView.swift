//  FindFalconeApp.swift
//  FindFalcone

//  Created by Palla Kumar on 04/07/25.

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FindFalconeViewModel()
    @State private var showMenu = false
    @State private var navigateToCarousel = false


    var body: some View {
        ZStack {
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
                        
                        //Navigation to movie list page
                        Button("Movie List") {
                            navigateToCarousel = true
                        }
                        .buttonStyle(.borderedProminent)

                        // Hidden NavigationLink triggered by state
                        NavigationLink(
                            destination: MovieCarousel(),
                            isActive: $navigateToCarousel
                        ) {
                            EmptyView()
                        }
                        //Navigation to movie list page until above line
                    }
                    .padding()
                }
                .navigationBarTitle("Find Falcone", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                })
                .onAppear {
                    viewModel.fetchData()
                }
            }
            .disabled(showMenu)

            // Side Menu Overlay
            if showMenu {
                GeometryReader { _ in
                    EmptyView()
                }
                .background(Color.black.opacity(0.3))
                .onTapGesture {
                    withAnimation {
                        showMenu = false
                    }
                }
            }

            // Side Menu
            HStack {
                SideMenuView()
                    .frame(width: 250)
                    .offset(x: showMenu ? 0 : -250)
                    .animation(.easeInOut(duration: 0.3), value: showMenu)

                Spacer()
            }
        }
    }
}
