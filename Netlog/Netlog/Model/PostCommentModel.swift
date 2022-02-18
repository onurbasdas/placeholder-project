//
//  PostCommentModel.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import Foundation

struct PostCommentModel: Codable {
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
}
