//
//  NewToDoView.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/29/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack{
            Text("New Goal")
                .font(.title)
                .fontWeight(.bold)
            
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Picker")) {
                Text("Pick a goal").tag(1)
                Text("Use a metal straw").tag(2)
                Text("Use a metal bottle instead of plastic").tag(3)
            }
            

            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
            }
            Button{
                addToDo()
                showNewTask = false
            } label:{
                Text("Save")
            }
        }
        .padding()

    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false))
    
}
