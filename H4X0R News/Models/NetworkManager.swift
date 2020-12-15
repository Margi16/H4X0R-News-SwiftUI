//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Margi Bhatt on 16/11/20.
//

import Foundation

class NetworkManager: ObservableObject {
    //observable object makes the class available to other interested classes as well
    @Published var posts = [Post]()
    //whenever a change is noticed, a notification is sent to all the listeners
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
