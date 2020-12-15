//
//  ContentView.swift
//  H4X0R News
//
//  Created by Margi Bhatt on 15/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    //listener takes that property of observable
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink (
                    destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                 
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Holo")
//]
