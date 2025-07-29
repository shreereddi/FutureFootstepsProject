//
//  ContentView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/29/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let name: String
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
                    NavigationLink(destination: NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false))) {
                        Text("+")
                        
                    }
                    .font(.system(size: 50))
                }
                .padding()
                Spacer()
                
                
                List{
                    ForEach(toDos){ toDoItem in
                        if toDoItem.isImportant {
                            Text("‼️" + toDoItem.title)
                        } else {
                            Text(toDoItem.title)
                        }
                    }
                    .onDelete(perform: deleteToDo)
                }
                .listStyle(.plain)
                
                
            }
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
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

#Preview {
    ContentView(name: "")
        .modelContainer(for: ToDoItem.self, inMemory: true)

}
