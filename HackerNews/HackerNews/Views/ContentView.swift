//
//  ContentView.swift
//  HackerNews
//
//  Created by Eric Cabestany Mena on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url), label: {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                })
                    
            }
            .navigationTitle("Hacker News")
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
//    Post(id: "1", title: "Post 1"),
//    Post(id: "2", title: "Post 2"),
//    Post(id: "3", title: "Post 3"),
//]
