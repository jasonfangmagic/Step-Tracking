//
//  ContentView.swift
//  Step Tracking
//
//  Created by Jason Fang on 6/18/24.
//

import SwiftUI

enum HeaklthMetricContext: CaseIterable, Identifiable {
    case steps, weight
    var id: Self {self}
    var title: String {
        switch self {
        case .steps:
            return "Steps"
        case .weight:
            return "Weight"
        }
    }
}

struct DashboardView: View {
    
    @State private var selectedStat: HeaklthMetricContext = .steps
    var isSteps: Bool { selectedStat == .steps }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    Picker("Selected Stat", selection: $selectedStat) {
                        ForEach(HeaklthMetricContext.allCases) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)
                    VStack {
                        NavigationLink(value: selectedStat ){
                            HStack{
                                VStack(alignment: .leading) {
                                    Label("Steps", systemImage: "figure.walk")
                                        .font(.title3.bold())
                                        .foregroundStyle(.pink)
                                    
                                    Text("Avg: 10K Steps")
                                        .font(.caption)
                                }
                        }
                            Spacer()
                            Image(systemName: "chevron.right")
                                
                        }
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                    
                    
                    VStack (alignment: .leading) {
                        HStack{
                            
                            VStack(alignment: .leading) {
                                Label("Averages", systemImage: "calendar")
                                    .font(.title3.bold())
                                    .foregroundStyle(.pink)
                                
                                Text("Last 28 Days")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            
                        }
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }
                
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationDestination(for: HeaklthMetricContext.self) { metric in
                HealthDataListView(metric: metric)
            }
        }
        .tint(isSteps ? .pink : .indigo)
    }

}

#Preview {
    DashboardView()
}
