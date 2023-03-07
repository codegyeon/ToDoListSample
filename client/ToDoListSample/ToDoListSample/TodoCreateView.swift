//
//  TodoCreateView.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import SwiftUI

struct TodoCreateView: View {
    
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    TextField("Title", text: $title)
                        .padding()
                    TextField("Content", text: $content, axis: .vertical)
                        .padding()
                    Button(action: { create() }) {
                        Text("Add")
                    }
                }
            }
        }
        .navigationTitle("Create")
    }
    private func create() {
        
    }
}

struct TodoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        TodoCreateView()
    }
}
