//
//  Post.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 17/12/21.
//

import Foundation

struct Post: Decodable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct FinalDataPost{
    let id: Int
    let name: String
    let body: String
    let sumComment: Int
}
