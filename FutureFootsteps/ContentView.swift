//
//  ContentView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/29/25.
//

import SwiftUI
import SwiftData

struct ChecklistItem: Identifiable {
    let id = UUID()
    let title: String
    var isChecked: Bool
    
    init(title: String, isChecked: Bool = false) {
        self.title = title
        self.isChecked = isChecked
    }
}

struct ChecklistCategory: Identifiable {
    let id = UUID()
    let title: String
    var items: [ChecklistItem]
}

struct ContentView: View {
    let name: String
  

    @State private var checklistCategories: [ChecklistCategory] = [
        ChecklistCategory(title: "Energy Use", items: [
            ChecklistItem(title: "Turn off lights when leaving a room"),
            ChecklistItem(title: "Unplug devices not in use"),
            ChecklistItem(title: "Set thermostat 3 degrees higher (in summer)")
        ]),
        ChecklistCategory(title: "Transportation", items: [
            ChecklistItem(title: "Walk or bike instead of driving"),
            ChecklistItem(title: "Combine errands into 1 trip"),
            ChecklistItem(title: "Carpool or use public transit")
        ]),
        ChecklistCategory(title: "Waste", items: [
            ChecklistItem(title: "Use reusable bags"),
            ChecklistItem(title: "Avoid single-use plastics"),
            ChecklistItem(title: "Recycle properly")
        ]),
        ChecklistCategory(title: "Food & Water", items: [
            ChecklistItem(title: "Eat a plant-based meal"),
            ChecklistItem(title: "Buy local produce"),
            ChecklistItem(title: "Take a shorter shower")
        ]),
        ChecklistCategory(title: "Advocacy", items: [
            ChecklistItem(title: "Read about climate change"),
            ChecklistItem(title: "Support a green business"),
            ChecklistItem(title: "Talk to someone about sustainability")
        ])
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    HStack{
                        Text("\(name)'s Sustainability Checklist")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding()
                    }
                    .listRowBackground(Color.clear)
                    
                    NavigationLink(destination: Facts()) {
                        Text("Want to learn more about sustainability?")
                    }
                    
                }
                .listRowBackground(Color(red: 0.87, green: 0.92, blue: 0.87))
                    
                        ForEach($checklistCategories) { $category in
                            Section(header: Text(category.title)
                                .font(.headline)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                                .background(Color(red: 0.87, green: 0.92, blue: 0.87))
                                .cornerRadius(10)
                                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.406, green: 0.477, blue: 0.261)/*@END_MENU_TOKEN@*/)) {
                                        ForEach($category.items) { $item in
                                            ChecklistRow(item: $item)
                                                
                                        }
                                    }
                                }
                        
                    }
                    .background(Color(red: 0.9, green: 0.95, blue: 0.9))
                    .scrollContentBackground(.hidden)
                    .listStyle(.insetGrouped)
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    


struct ChecklistRow: View {
    @Binding var item: ChecklistItem
    
    var body: some View {
            HStack {
                Button(action: {
                    item.isChecked.toggle()
                }) {
                    Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(item.isChecked ? Color(red: 0.406, green: 0.477, blue: 0.261) : .gray)
                }.buttonStyle(PlainButtonStyle())
                Text(item.title)
                    .strikethrough(item.isChecked, color: Color(red: 0.406, green: 0.477, blue: 0.261))
                    .foregroundColor(item.isChecked ? /*@START_MENU_TOKEN@*/Color(red: 0.406, green: 0.477, blue: 0.261)/*@END_MENU_TOKEN@*/ : .black)
            }
            .animation(.default, value: item.isChecked)
    }
}

#Preview {
    ContentView(name: "Name")

}
