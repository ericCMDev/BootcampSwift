//
//  PostData.swift
//  HackerNews
//
//  Created by Eric Cabestany Mena on 14/12/22.
//

import Foundation


struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
