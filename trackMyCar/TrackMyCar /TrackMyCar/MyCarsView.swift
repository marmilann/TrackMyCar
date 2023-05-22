//
//  CarListView.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 12.04.2023.
//

import SwiftUI

struct MyCarsView: View {
    @ObservedObject var viewModel: CarDataViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.fetchAllCarData(), id: \.odometerReading) { carData in
                NavigationLink(destination: CarDetailView(carData: carData)) {
                    Text("Odometer: \(carData.odometerReading)")
                }
            }
            .navigationBarTitle(Text("Cars"))
            .navigationBarItems(trailing: Button(action: {
                self.viewModel.saveCarData(CarData(lastOilChange: Date(), fuelTankCapacity: 60.0, currentFuelLevel: 30.0, odometerReading: 10000.0))
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct CarDetailView: View {
    let carData: CarData
    
    var body: some View {
        VStack {
            Text("Odometer: \(carData.odometerReading)")
            Text("Last oil change: \(carData.lastOilChange?.description ?? "N/A")")
            Text("Fuel level: \(carData.currentFuelLevel)")
            Text("Fuel tank capacity: \(carData.fuelTankCapacity)")
        }
        .navigationBarTitle(Text("Car Details"))
    }
}
