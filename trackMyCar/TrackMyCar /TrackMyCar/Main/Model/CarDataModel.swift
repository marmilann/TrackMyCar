//
//  DataModel.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 11.04.2023.
//

import Foundation
import SwiftUI
import CoreData

struct CarData {
    var lastOilChange: Date?
    var fuelTankCapacity: Double
    var currentFuelLevel: Double
    var odometerReading: Double
}
