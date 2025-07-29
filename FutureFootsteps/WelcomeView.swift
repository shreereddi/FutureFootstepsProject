//
//  GoalSettingView.swift
//  FutureFootsteps
//
//  Created by Riya Shankaran on 7/29/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
            Spacer()
                .frame(height: 30)
            Text("FutureFootprint")
                .font(.system(size: 30))
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.406, green: 0.477, blue: 0.261)/*@END_MENU_TOKEN@*/)
                .bold()
            Spacer()
                .frame(height: 25)
            Text("Let's save the environment\none action at a time.")
                .multilineTextAlignment(.center)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.406, green: 0.477, blue: 0.261)/*@END_MENU_TOKEN@*/)
                .bold()
            Spacer()
                .frame(height: 30)
            Text("Enter your name to get started.")
                .font(.callout)
                .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                .fontWeight(.medium)
            Spacer()
                .frame(height: 30)
            TextField("Name", text: $name)
                .autocapitalization(.words)
                .padding()
                .frame(maxWidth: 300, maxHeight: 40)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            Spacer()
                .frame(height: 15)
            Button(action: {
                
            }) {
                Text("Continue")
                    .foregroundColor(Color.white)
                    .fontWeight(.medium)
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .cornerRadius(10)
                    
            }
                
        }
    }
}

#Preview {
    WelcomeView()
}
