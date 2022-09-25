//
//  ContentView.swift
//  List&Navigation
//
//  Created by JOYNAL ABEDIN on 24/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var toggleStatus = true
    
    var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notification")
                    }
                    
                }
                Section(header: Text("To Do Task")) {
                    ForEach(listData) { item in
                    NavigationLink(destination: Text(item.task)) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                    
                }
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: EditButton())
//            .navigationBarItems(trailing: Button(action: addTask, label: {
//                Text("Add")
//            }))
        }
    }
    
    func deleteItem(at offsets: IndexSet){
        //delete item from data source here
    }
    func moveItem(from source: IndexSet, to destination: Int) {
        //Reorder items is source data here
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
