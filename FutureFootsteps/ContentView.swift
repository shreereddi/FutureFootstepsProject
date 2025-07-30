//
//  ContentView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/29/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Sustainability Checklist")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                    Spacer()
                    NavigationLink(destination: NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false, date: Date()))) {
                        Text("+")
                        
                    }
                    .font(.system(size: 50))
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
                }
                .listStyle(.plain)
                
                
            }
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false, date: Date()))
            }
            Spacer()
        }
        }
        func deleteToDo(at offsets: IndexSet) {
            for offset in offsets {
                let toDoItem = toDos[offset]
                modelContext.delete(toDoItem)
            }
        }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)

}
