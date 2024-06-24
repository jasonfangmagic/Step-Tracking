//
//  HealthMetric.swift
//  Step Tracking
//
//  Created by Jason Fang on 6/24/24.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
