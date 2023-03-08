//
//  TodoController.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import Foundation

class TodoViewModel: ObservableObject {
    
    let domain = "http://localhost:8080"
    let route = "/api/todolist/"
    
    @Published var todos = [TodoModel]()
        
    func getData() {
        guard let url = URL(string: domain + route) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([TodoModel].self, from: data)
                DispatchQueue.main.async {
                    self.todos = decodedData
                }
            } catch let error {
                print("Decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func postData(title: String, content: String) {
        guard let url = URL(string: domain + route) else {
            print("Invalid URL")
            return
        }

        let post = TodoModelPost(title: title, content: content)

        guard let postData = try? JSONEncoder().encode(post) else {
            print("Failed to encode post data")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }

            if response.statusCode == 201 {
                print("Post created successfully")
            } else {
                print("Failed to create post")
            }
        }.resume()
    }
    
    func deleteData(id: Int) {
        guard let url = URL(string: "\(domain + route + String(id))") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        }
        task.resume()
    }
    
    func patchData(id: Int, updated: Bool) {
        let url = URL(string: "\(domain + route + String(id))")!
                
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        let parameters = ["updated": updated]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let data = data {
                if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print(responseJSON)
                }
            }
        }.resume()
    }
}
