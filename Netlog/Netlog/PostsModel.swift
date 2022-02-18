//
//  PostsModel.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import Foundation

struct PostsModel: Codable {
    var userId : Int
    var id : Int
    var title : String
    var body : String
}
