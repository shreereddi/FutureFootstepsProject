//
//  LinksView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/31/25.
//

import SwiftUI
import AVKit


struct LinksView: View {
    var body: some View {
        ZStack{
            Color(red: 0.9, green: 0.95, blue: 0.9)
                .ignoresSafeArea()
            VStack(spacing: 24){
                Text("Resources")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                
                Group{
                    VStack {
                        Text("Want to learn about Sustainability?")
                        Text("Click the link below.")
                    }
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    
                    Link(destination: URL(string: "https://www.epa.gov/sustainability")!) {
                        Text("EPA Sustainability Page")
                            .padding(.all)
                            .cornerRadius(20)
                            .background(Color(red: 0.87, green: 0.92, blue: 0.87))
                    }
                    
                    Image("Plants")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        
                }
                Divider()
                Group{
                    VStack {
                        Text("Want to learn about Water Sustainability?")
                        Text("Click the link below.")
                    }
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Link(destination: URL(string: "https://www.aquatechtrade.com/news/water-treatment/sustainable-water-essential-guide")!) {
                        Text("Aquatech Water Sustainability")
                            .padding(.all)
                            .cornerRadius(20)
                            .background(Color(red: 0.87, green: 0.92, blue: 0.87))
                    }
                    .padding(.horizontal)
                    
                    Image("water")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        
                }
                
            }
        }
        
    }
}

#Preview {
    LinksView()
}
