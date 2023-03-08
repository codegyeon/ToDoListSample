//
//  TodoCreateView.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import SwiftUI

struct TodoCreateView: View {
    
    @ObservedObject var todoViewModel = TodoViewModel()
    
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
                    Button(action: { todoViewModel.postData(title: title, content: content) }) {
                        Text("Add")
                    }
                }
            }
        }
        .navigationTitle("Create")
    }
}

struct TodoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        TodoCreateView()
    }
}
