//
//  ContentView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/29/25.
//

import SwiftUI
import SwiftData

class ChecklistItem: ObservableObject, Identifiable {
    let id = UUID()
    let title: String
    @Published var isChecked: Bool
    
    init(title: String, isChecked: Bool = false) {
        self.title = title
        self.isChecked = isChecked
    }
}

struct ContentView: View {
    let name: String
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext

    @State private var items: [ChecklistItem] = [
        ChecklistItem(title: "Turn off lights"),
        ChecklistItem(title: "Use metal straw"),
        ChecklistItem(title: "Bike instead of drive")
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("\(name)'s Sustainability Checklist")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false, date: Date()))) {
                        Text("+")
                        
                    }
                    .font(.system(size: 50))
                }
                .padding()
                Spacer()
                /*
                List {
                    ForEach(items.indices, id: \.self) { index in
                        HStack {
                            Button(action: {
                                items[index].isChecked.toggle()
                            }) {
                                Image(systemName: items[index].isChecked ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(items[index].isChecked ? .green : .gray)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Text(items[index].title)
                        }
                    }
                 
                }
                */
                
                List {
                    ForEach(items) { item in
                        ChecklistRow(item: item)
                    }
                }
                
                List{
                    ForEach(toDos){ toDoItem in
                        if toDoItem.isImportant {
                            Text("‼️ \(toDoItem.title) \(toDoItem.date.formatted(.dateTime.month().day().year()))")

                           
                        } else {
                            Text("\(toDoItem.title) \(toDoItem.date.formatted(.dateTime.month().day().year()))")

                        }
                    }
                    .onDelete(perform: deleteToDo)
                }
                .listStyle(.plain)
                
                
            }
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false, date: Date()))
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        }
        func deleteToDo(at offsets: IndexSet) {
            for offset in offsets {
                let toDoItem = toDos[offset]
                modelContext.delete(toDoItem)
            }
        }
}

struct ChecklistRow: View {
    @ObservedObject var item: ChecklistItem
    
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
    ContentView(name: "")
        .modelContainer(for: ToDoItem.self, inMemory: true)

}
