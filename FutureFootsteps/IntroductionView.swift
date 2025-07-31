//
//  GoalSettingView.swift
//  FutureFootsteps
//
//  Created by Riya Shankaran on 7/29/25.
//

import SwiftUI
import SwiftData


struct IntroductionView: View {
    let name: String
    
    @Environment(\.modelContext) private var context
    @Query private var sessions: [UserSession]
    
    var body: some View {
        ZStack {
            Text("Hi")
            /*@START_MENU_TOKEN@*/Color(red: 0.857, green: 0.912, blue: 0.732)/*@END_MENU_TOKEN@*/
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 24) {
                Text("Welcome, \(name)!")
                    .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .fontWeight(.bold)
                    .font(.largeTitle).padding(.horizontal)
                Text("We appreciate your commitment\n to helping the environment.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    .fontWeight(.medium).font(.title3)
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
                    if let session = sessions.first {
                        Spacer().frame(height: 20)
                        Text("Last login: \(formattedDate(session.lastLoginDate))")
                            .fontWeight(.heavy)
                            .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                        Spacer().frame(height: 15)
                        Text("Login streak: \(session.loginStreak) 🔥")
                            .fontWeight(.heavy)
                            .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    }
                }
            }
        }
        .onAppear{
            if let session = sessions.first {
                checkAndUpdateLogin(for: session)
            } else {
                createSession()
            }
    }
        
}
    
    private func createSession() {
        let newSession = UserSession(lastLoginDate: Date(), loginStreak: 1)
        context.insert(newSession)
        try? context.save()
    }

private func checkAndUpdateLogin(for session: UserSession) {
    let calendar = Calendar.current
    let today = calendar.startOfDay(for: Date())
    session.loginStreak += 1
    session.lastLoginDate = today
    try? context.save()
    
}
        
        //The code below is a typical login streak by days
        /*
         let calendar = Calendar.current
                 let today = calendar.startOfDay(for: Date())
                 let lastLoginDay = calendar.startOfDay(for: session.lastLoginDate)

                 if lastLoginDay == today {
                     print("Already logged in today.")
                     return
                 }

                 if let yesterday = calendar.date(byAdding: .day, value: -1, to: today),
                    lastLoginDay == calendar.startOfDay(for: yesterday) {
                     // Continue streak
                     session.loginStreak += 1
                     print("Streak continued: \(session.loginStreak)")
                 } else {
                     // Reset streak
                     session.loginStreak = 1
                     print("Streak reset.")
                 }

                 session.lastLoginDate = today
                 try? context.save()
         */
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }





#Preview {
    IntroductionView(name: "Name")
}
