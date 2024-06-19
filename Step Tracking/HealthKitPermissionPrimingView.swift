//
//  HealthKitPermissionPrimingView.swift
//  Step Tracking
//
//  Created by Jason Fang on 6/19/24.
//

import SwiftUI
import HealthKitUI

struct HealthKitPermissionPrimingView: View {
    
    @Environment(HealthKitManager.self) private var hkManager
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingHealthKitPermission = false
    var description = """
This app display your step and weight data in interactive charts.

You can also aadd new step or weight data to Apple Health from this app. You data is private and secured
"""
    
    var body: some View {
        VStack(spacing: 130) {
            VStack(alignment: .leading, spacing: 10) {
                Image(.appleHealth)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 12)
                Text("Apple Health Integration")
                    .font(.title2).bold()
                
                Text(description)
                    .foregroundStyle(.secondary)
            }
            
            Button("Connec Apple Health"){
                isShowingHealthKitPermission = true
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(30)
        .healthDataAccessRequest(store: hkManager.store, shareTypes: hkManager.types, readTypes: hkManager.types, trigger: isShowingHealthKitPermission) { result in
            switch result {
            case .success(_):
                dismiss()
            case .failure(_):
                dismiss()
            }
        }
    }
        
}

#Preview {
    HealthKitPermissionPrimingView()
        .environment(HealthKitManager())
}
