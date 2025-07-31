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
                    VStack(spacing: 30) {
                        Text("Sustainability")
                            .font(.largeTitle)
                            .bold()                        
                        NavigationLink("Sustainability Facts") {
                            FactsView()
                        }
                        .buttonStyle(.borderedProminent)

                        NavigationLink("Links + Videos") {
                            LinksView()
                        }
                        .buttonStyle(.borderedProminent)

                        NavigationLink("The Future") {
                            FutureView()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
    }
}

#Preview {
    Facts()
}
