//
//  Service.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import Foundation

class Service {
    private let encoder = JSONEncoder()
    
    func getPostsData(completionHandler: @escaping ([PostsModel]?, String?) -> Void) {
        let urlRequest = ApiHelper.createURLRequest("/posts", httpMethod: .GET)
        CustomSession<[PostsModel]>().dataTask(urlRequest, completionHandler: completionHandler )
    }
    
    func getPostCommentData(id:Int, completionHandler: @escaping ([PostCommentModel]?, String?) -> Void) {
        let urlRequest = ApiHelper.createURLRequest("/posts/\(id)/comments", httpMethod: .GET)
        CustomSession<[PostCommentModel]>().dataTask(urlRequest, completionHandler: completionHandler )
    }
}
