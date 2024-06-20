//
//  Step_TrackingApp.swift
//  Step Tracking
//
//  Created by Jason Fang on 6/18/24.
//hello

import SwiftUI

@main
struct Step_TrackingApp: App {
    
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)
        }
    }
}
