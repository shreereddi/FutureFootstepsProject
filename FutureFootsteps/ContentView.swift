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
    @State private var showNewTask = false
    @State private var navigateToNewTask = false
    @State private var newToDoItem = ToDoItem(title: "", isImportant: false, date: Date())
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext

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
<<<<<<< HEAD

            VStack{
                HStack{
                    Text("\(name)'s Sustainability Checklist")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Spacer()
                    /*NavigationLink(destination: NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false, date: Date()))) {
                        Text("+")
                        
                    }
                    .font(.system(size: 50))*/
                    NavigationLink(
                        destination: NewToDoView(
                            showNewTask: .constant(false), 
                            toDoItem: ToDoItem(title: "", isImportant: false, date: Date())
                        )
                    ) {
                        Text("+")
                            .font(.system(size: 50))
                    }

                }
                .padding()
                Spacer()
                
                
                List{
                    ForEach(toDos){ toDoItem in
                        if toDoItem.isImportant {
                            Text("‼️ \(toDoItem.title) \(toDoItem.date.formatted(.dateTime.month().day().year()))")

                           
                        } else {
                            Text("\(toDoItem.title) \(toDoItem.date.formatted(.dateTime.month().day().year()))")
                            

                        }
                    }
                    .onDelete(perform: deleteToDo)
=======
        
        NavigationStack {
            List {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(name)'s Sustainability Checklist")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding()
                    
                    
                        ForEach($checklistCategories) { $category in
                            VStack(alignment: .leading, spacing: 7) {
                                Text(category.title)
                                    .font(.headline)
                                    .padding(.bottom, 4)
                                ForEach($category.items) { $item in
                                    ChecklistRow(item: $item)
                                }
                            }
                            
                            .padding(.top)
                        
                        
                        .navigationBarBackButtonHidden(true)
                        
                    }.listStyle(.grouped)
                        .padding(.horizontal)
>>>>>>> main
                }
            }
<<<<<<< HEAD
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false, date: Date()))
            }
            Spacer()
        .navigationBarBackButtonHidden(true)
=======
>>>>>>> main
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
                        .foregroundColor(item.isChecked ? .green : .gray)
                }.buttonStyle(PlainButtonStyle())
                Text(item.title)
            }
    }
}

#Preview {
<<<<<<< HEAD
        ContentView(name: "")
            .modelContainer(for: ToDoItem.self)

=======
    ContentView(name: "Name")
        .modelContainer(for: ToDoItem.self, inMemory: true)
>>>>>>> main

}
