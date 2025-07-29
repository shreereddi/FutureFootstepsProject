//
//  GoalSettingView.swift
//  FutureFootsteps
//
//  Created by Riya Shankaran on 7/29/25.
//

import SwiftUI

struct GoalSettingView: View {
    let name: String
    
    var body: some View {
        ZStack {
            /*@START_MENU_TOKEN@*/Color(red: 0.857, green: 0.912, blue: 0.732)/*@END_MENU_TOKEN@*/
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome, \(name)!")
                    .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 20)
                Text("We appreciate your commitment\n to helping the environment.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .fontWeight(.medium)
                
            }
        }
    }
}

#Preview {
    GoalSettingView(name: "Name")
}
