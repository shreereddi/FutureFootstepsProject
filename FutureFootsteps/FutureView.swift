//
//  FutureView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/31/25.
//

import SwiftUI

struct FutureView: View {
    @State private var energyExpanded = false
        @State private var citiesExpanded = false
        @State private var techExpanded = false
        @State private var economyExpanded = false
        @State private var goalsExpanded = false

        var body: some View {
            ScrollView {
                VStack(spacing: 24) {
                    Text("The Future of Sustainability")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.top)
                        .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    
                    Text("Click on the boxes below to learn more about the future of sustainability. Remeber: The future is in your hands!")
                        .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                        .multilineTextAlignment(.center)
                    
                    DisclosureGroup("⚡ Clean Energy Revolution", isExpanded: $energyExpanded) {
                        Text("Solar, wind, and fusion energy are rapidly replacing fossil fuels. Battery storage innovations are making renewable power more reliable than ever.")
                            .padding(.top, 4)
                        
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    
                    
                    DisclosureGroup("🏙️ Smart Sustainable Cities", isExpanded: $citiesExpanded) {
                        Text("Urban centers of the future will include smart grids, green roofs, autonomous electric transport, and AI-driven traffic management.")
                            .padding(.top, 4)
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    
                    DisclosureGroup("🤖 Climate Tech & AI", isExpanded: $techExpanded) {
                        Text("AI and machine learning will track emissions, predict wildfires, optimize farming, and help design energy-efficient buildings.")
                            .padding(.top, 4)
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    
                    DisclosureGroup("♻️ Circular Economy", isExpanded: $economyExpanded) {
                        Text("Future economies will emphasize reusability, with companies designing products to be repaired, reused, or composted.")
                            .padding(.top, 4)
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    
                    DisclosureGroup("📆 Global Sustainability Goals", isExpanded: $goalsExpanded) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("🌍 2030: Deadline for the United Nations Sustainable Development Goals.")
                            Text("🏭 2040: Net-zero targets set by major corporations.")
                            Text("🌐 2050: Many nations committed to achieving full carbon neutrality.")
                        }
                        .padding(.top, 4)
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    
                }
                .padding()
            }
            .background(Color(red: 0.9, green: 0.95, blue: 0.9).ignoresSafeArea())
        }
}

#Preview {
    FutureView()
}
