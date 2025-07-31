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
    @State private var navigateToNewTask = false
    @State private var newToDoItem = ToDoItem(title: "", isImportant: false, date: Date())
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    var body: some View {

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
                }
                .listStyle(.plain)
                
                
            }
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false, date: Date()))
            }
            Spacer()
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
            .modelContainer(for: ToDoItem.self)


}
