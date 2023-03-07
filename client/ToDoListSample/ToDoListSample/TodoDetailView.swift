//
//  TodoDetailView.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import SwiftUI

struct TodoDetailView: View {
    @State private var title = "title"
    @State private var content = "content"
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text(title)
                        .padding()
                    Text(title)
                        .padding()
                    Button(action: { update() }) {
                        Text("Edit")
                    }
                    Button(action: { delete() }) {
                        Text("Delete")
                    }
                }
            }
        }
        .navigationTitle("Create")
    }
    private func update() {
        
    }
    private func delete() {
        
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView()
    }
}
