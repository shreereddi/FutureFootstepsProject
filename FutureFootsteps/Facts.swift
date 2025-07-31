//
//  Facts.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/31/25.
//

import SwiftUI

struct Facts: View {
    var body: some View {
            NavigationStack {
                ZStack{
                    Color(red: 0.9, green: 0.95, blue: 0.9)
                        .ignoresSafeArea()
                VStack(spacing: 30) {
                    Text("Sustainability")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 0.406, green: 0.477, blue: 0.261))
                    NavigationLink("Sustainability Facts") {
                        FactsView()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.406, green: 0.477, blue: 0.261))
                    NavigationLink("Links + Videos") {
                        LinksView()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.406, green: 0.477, blue: 0.261))
                    
                    NavigationLink("The Future") {
                        FutureView()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.406, green: 0.477, blue: 0.261))
                }
                .padding()
            }
        }
    }
}

#Preview {
    Facts()
}
