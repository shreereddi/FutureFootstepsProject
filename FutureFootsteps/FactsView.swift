//
//  FactsView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/31/25.
//

import SwiftUI

struct FactsView: View {
    var body: some View {
        ZStack{
            Color(red: 0.9, green: 0.95, blue: 0.9)
                .ignoresSafeArea()
            VStack{
                Text("Quick Facts")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                
                List {
                    Group{
                        Text("🌎 The Earth’s average temperature has risen about 1.1°C since the late 19th century.")
                        Text("♻️ Recycling one aluminum can saves enough energy to run a TV for 3 hours.")
                        Text("🚿 Reducing shower time by 2 minutes can save 10 gallons of water per day.")
                        Text("🌲 Forests cover 31% of the land area on Earth, but we lose an area the size of a football field every second.")
                        Text("🌡️ The last eight years were the warmest on record globally.")
                        Text("🛍️ A plastic bag takes up to 1,000 years to degrade in a landfill.")
                        Text("🔋 Only 5% of lithium-ion batteries are recycled globally.")
                        Text("🗑️ Around 1/3 of all food produced globally is wasted.")
                        Text("🚗 Transportation accounts for nearly 25% of global carbon dioxide emissions.")
                        Text("☀️ Solar energy is now the cheapest source of electricity in history (according to the IEA).")
                        Text("💧 It takes about 1,800 gallons of water to produce one pound of beef.")
                        Text("👕 One cotton T-shirt takes about 713 gallons of water to produce.")
                        Text("🔥 Methane is over 25 times more potent than CO₂ at trapping heat in the atmosphere.")
                        Text("📦 E-commerce packaging waste is expected to reach 4.5 million tons by 2025.")
                        Text("🐟 Over 8 million tons of plastic enter the ocean every year.")
                        Text("🏭 The fashion industry is responsible for 10% of global carbon emissions.")
                        Text("🛢️ Fossil fuels still account for over 80% of global energy use.")
                        Text("🔄 Composting food waste can reduce landfill emissions and create rich soil.")
                        Text("🚰 Nearly 2 billion people lack access to safely managed drinking water.")
                        Text("🌐 If the global population reaches 9.8 billion by 2050, food production must increase by 60%.")
                        Text("💡 LED bulbs use at least 75% less energy and last 25 times longer than incandescent lighting.")
                        Text("📉 Renewable energy jobs now outnumber fossil fuel jobs in many countries.")
                    }
                    .padding(.vertical, 5)
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Sustainability Facts")
               

            }
            
        }
    }
}

#Preview {
    FactsView()
}
