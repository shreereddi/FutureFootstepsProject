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
    @State private var completionDate = Date()
    @State private var selectedGoal = 1
    @Environment(\.modelContext) var modelContext
    var selectedGoalTitle: String {
        switch selectedGoal {
        case 1: return "Recycle"
        case 2: return "Use a metal straw"
        case 3: return "Use a metal bottle instead of plastic"
        default: return ""
        }
    }
   
    var body: some View {
        ZStack {
            /*@START_MENU_TOKEN@*/Color(red: 0.857, green: 0.912, blue: 0.732)/*@END_MENU_TOKEN@*/
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("New Goal")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                Spacer()
                    .frame(height: 20)
                HStack{
                    Text("Pick a Goal")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    Picker(selection: $selectedGoal, label: Text("Picker")) {
                        Text("Recycle").tag(1)
                        Text("Use a metal straw").tag(2)
                        Text("Use a metal bottle instead of plastic").tag(3)
                    }
                    .pickerStyle(.automatic)
                }
                .padding()
            
                
                DatePicker(
                    selection: $completionDate,
                    displayedComponents: .date,
                    label: {
                        Text("Date to Complete")
                            .fontWeight(.semibold)
                    }
                )
                .padding(.all, 20.0)
                
               
                    Toggle(isOn: $toDoItem.isImportant) {
                        Text("Is it important?")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                
               
                Button{
                    toDoItem.title = selectedGoalTitle
                    toDoItem.date = completionDate
                    addToDo()
                    showNewTask = false
                } label:{
                    Text("Save")
                }
                .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 40)
                        .background(Color.blue)
                        .cornerRadius(10)
            }
           
            Spacer()
                .frame(height: 200)
            
        }
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant, date: toDoItem.date)
        modelContext.insert(toDo)
    }
}

#Preview {
    NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false, date: Date() ))
    
}
