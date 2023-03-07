//
//  ContentView.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(red: 244 / 255, green: 244 / 255, blue: 244 / 255).ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack() {
                        ForEach(0..<10) { todo in
                            NavigationLink(destination: TodoDetailView()) {
                                VStack {
                                    HStack {
                                        Text("title\(todo)")
                                            .foregroundColor(.black)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .padding(4)
                                        Spacer()
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.size.width / 12)
                                    .padding(.top, UIScreen.main.bounds.size.width / 32)
                                    HStack {
                                        Spacer()
                                        Text("created\(todo)")
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
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
