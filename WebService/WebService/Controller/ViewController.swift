//
//  ViewController.swift
//  WebService
//
//  Created by Sagar Ajudiya on 04/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    let urlUsers = URL(string: "https://jsonplaceholder.typicode.com/users")!
    var urlPosts = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    var userId: Int = 0

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callUserApi(cmp: callPostsApi)
    }

    // MARK: - Functions
    private func callUserApi(cmp: @escaping () -> ()) {
        let task = URLSession.shared.dataTask(with: urlUsers, completionHandler: { [weak self] data, response, error in
            guard let data else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] else { return }
//                print(json)
                json.forEach{
                    guard let dictionary = $0 as? [String: Any] else { return }
//                    print(dictionary["username"] as? String ?? "")
//                    print(dictionary)
//                    print((dictionary["username"] as? String ?? "").first)
                    if((dictionary["username"] as? String ?? "") == "Samantha") {
//                        print(dictionary["id"] as? Int ?? 0)
                        self?.userId = dictionary["id"] as? Int ?? 0
                        cmp()
                    }
                }
            } catch let parseError {
                print("JSON Error \(parseError.localizedDescription)")
            }
            
        })
        task.resume()
    }
    
    private func callPostsApi() {
        let queryItems = [URLQueryItem(name: "userId", value: String(userId))]
        urlPosts.append(queryItems: queryItems)
        
        let task = URLSession.shared.dataTask(with: urlPosts, completionHandler: { data, response, error in
            guard let data else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] else { return }
//                print(json)
                json.forEach {
                    guard let dictionary = $0 as? [String: Any] else { return }
                    guard let body = dictionary["body"] as? String else { return }
                    if body.first == "e" {
                        print(body)
                        print("---------")
                    }
                }
            } catch let parseError {
                print("JSON Error \(parseError.localizedDescription)")
            }
            
        })
        task.resume()
    }
    
}

