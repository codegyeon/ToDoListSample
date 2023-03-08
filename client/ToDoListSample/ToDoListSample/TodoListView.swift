//
//  ContentView.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var todoViewModel = TodoViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(red: 244 / 255, green: 244 / 255, blue: 244 / 255).ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack() {
                        ForEach(todoViewModel.todos, id: \.id) { todo in
                            NavigationLink(destination: TodoDetailView(todo)) {
                                VStack {
                                    HStack {
                                        Text(todo.title)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(todo.updated ? .gray : .black)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .padding(4)
                                        Spacer()
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.size.width / 12)
                                    .padding(.top, UIScreen.main.bounds.size.width / 32)
                                    HStack {
                                        Spacer()
                                        Text(todo.content)
                                            .multilineTextAlignment(.trailing)
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                            .fontWeight(.medium)
                                            .padding(4)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(12)
                            .padding()
                            .shadow(radius: 4)
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle("List")
            .toolbar {
                NavigationLink(destination: TodoCreateView()) {
                    Image(systemName: "plus")
                        .foregroundColor(.accentColor)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
        }
        .onAppear {
            self.todoViewModel.getData()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
