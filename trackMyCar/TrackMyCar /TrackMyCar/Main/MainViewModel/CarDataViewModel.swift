//
//  CarDataViewModel.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 11.04.2023.
//

import Foundation
import CoreData

class CarDataViewModel: ObservableObject {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "CarDataModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
    }
    
    func saveCarData(_ carData: CarData) {
        let car = Car(context: persistentContainer.viewContext)
        car.lastOilChange = carData.lastOilChange
        car.fuelTankCapacity = carData.fuelTankCapacity
        car.currentFuelLevel = carData.currentFuelLevel
        car.odometerReading = carData.odometerReading
        saveContext()
    }
    
    func fetchAllCarData() -> [CarData] {
           let request: NSFetchRequest<Car> = Car.fetchRequest()
           do {
               let cars = try persistentContainer.viewContext.fetch(request)
               return cars.map { CarData(lastOilChange: $0.lastOilChange, fuelTankCapacity: $0.fuelTankCapacity, currentFuelLevel: $0.currentFuelLevel, odometerReading: $0.odometerReading) }
           } catch {
               print("Failed to fetch car data: \(error)")
               return []
           }
       }
       
       private func saveContext() {
           do {
               try persistentContainer.viewContext.save()
           } catch {
               print("Failed to save context: \(error)")
           }
       }
   }
