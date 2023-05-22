//
//  ContentView.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 11.04.2023.
//

import SwiftUI
import CoreData

struct MainView: View {
    @ObservedObject var carDataViewModel = CarDataViewModel()
    @State private var showModal = false
    @State private var isSaving = false
    @State private var lastOilChangeDate = Date()
    @State private var fuelTankCapacity = 0.0
    @State private var currentFuelLevel = 0.0
    @State private var odometerReading = 0.0
    
    var body: some View {
        TabView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    List(carDataViewModel.fetchAllCarData(), id: \.lastOilChange) { carData in
                        VStack(alignment: .leading) {
                            Text("Last oil change: \(carData.lastOilChange?.description ?? "N/A")")
                            Text("Fuel tank capacity: \(carData.fuelTankCapacity) L")
                            Text("Current fuel level: \(carData.currentFuelLevel) L")
                            Text("Odometer reading: \(carData.odometerReading) km")
                        }
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding()
                    
                    //                    NavigationLink(destination: MainView(viewModel: carDataViewModel)) {
                    //                        Text("Список машин")
                    //                            .font(.headline)
                    //                            .foregroundColor(.white)
                    //                            .padding()
                    //                            .background(Color.blue)
                    //                            .cornerRadius(10)
                    //                    }
                    //                                .navigationTitle("Моя машина")
                    
                    if isSaving {
                        VStack {
                            Text("Saving...")
                                .modifier(RegularBody())
                                .foregroundColor(.blue)
                                .padding()
                                .background(Color(white: 1, opacity: 0.3) )
                                .cornerRadius(12)
                                .transition(.move(edge: .bottom))
                                .animation(.default)
                        }
                    }
                    
                    Button(action: {
                        isSaving = false
                        showModal = true
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(20)
                            .background(Color.white)
                            .foregroundColor(.red)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3)
                                    .scaleEffect(showModal ? 1.2 : 1)
                                    .opacity(showModal ? 0 : 1)
                                    .animation(.spring())
                            )
                    })
                    .disabled(isSaving)
                    .animation(.spring())
                    .sheet(isPresented: $showModal, content: {
                        VStack {
                            DatePicker("Last oil change", selection: $lastOilChangeDate, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .padding()
                            TextField("Fuel tank capacity", value: $fuelTankCapacity, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .padding()
                            TextField("Current fuel level", value: $currentFuelLevel, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .padding()
                            TextField("Odometer reading", value: $odometerReading, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .padding()
                            Button(action: {
                                let carData = CarData(lastOilChange: lastOilChangeDate, fuelTankCapacity: fuelTankCapacity, currentFuelLevel: currentFuelLevel, odometerReading: odometerReading)
                                carDataViewModel.saveCarData(carData)
                                showModal = false
                                isSaving = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    isSaving = false
                                }
                            }, label: {
                                Text("Save")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .cornerRadius(8)
                            })
                            .padding()
                        }
                    })
                }
            }
            .navigationBarTitle("My Car")
            .modifier(Title1())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                }
            }
        }
    }
}
