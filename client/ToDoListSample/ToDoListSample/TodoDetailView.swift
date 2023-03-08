//
//  TodoDetailView.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import SwiftUI

struct TodoDetailView: View {
    
    @ObservedObject var todoViewModel = TodoViewModel()
    
    @State var todo: TodoModel
    
    init(_ todo: TodoModel) {
        self.todo = todo
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text(todo.title)
                        .padding()
                    Text(todo.content)
                        .padding()
                    Button(action: { todoViewModel.patchData(id: todo.id, updated: todo.updated) }) {
                        Text("Done")
                    }
                    .padding()
                    Button(action: { todoViewModel.deleteData(id: todo.id) }) {
                        Text("Delete")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .navigationTitle("Create")
    }
}
