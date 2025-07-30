//
//  GoalSettingView.swift
//  FutureFootsteps
//
//  Created by Riya Shankaran on 7/29/25.
//

import SwiftUI

struct IntroductionView: View {
    let name: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                /*@START_MENU_TOKEN@*/Color(red: 0.857, green: 0.912, blue: 0.732)/*@END_MENU_TOKEN@*/
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 24) {
                    Text("Welcome, \(name)!")
                        .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(.horizontal)
                    Text("We appreciate your commitment\n to helping the environment.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                        .fontWeight(.medium)
                        .font(.title3)
                    Text("⎯")
                        .font(.title2)
                        .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    VStack(spacing: 10) {
                        Text("Each day, keep track of the actions\nyou took to reduce your carbon footprint.\nWe'll help you reach your goals!")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                            .font(.body)
                        Spacer()
                            .frame(height: -10)
                        NavigationLink(destination: ContentView(name: name)) {
                            Text("Let's go!")
                                .font(.headline)
                                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.857, green: 0.912, blue: 0.732)/*@END_MENU_TOKEN@*/)
                                .frame(maxWidth: 300, maxHeight: 50)
                                .background(Color(red: 0.406, green: 0.477, blue: 0.261))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    IntroductionView(name: "Name")
}
