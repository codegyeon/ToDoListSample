//
//  TodoController.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import Foundation

class TodoController: ObservableObject {
    @Published var todos: [TodoModel]
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
                        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                DispatchQueue.main.async {
                    self.todos = json
                }
            }
        }.resume()
    }
}
