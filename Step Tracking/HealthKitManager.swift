//
//  HealthKitManager.swift
//  Step Tracking
//
//  Created by Jason Fang on 6/19/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {
    let store = HKHealthStore()
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
