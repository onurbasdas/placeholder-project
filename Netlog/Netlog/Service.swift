//
//  Service.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import Foundation

class Service {
    private let encoder = JSONEncoder()
    
    func exchangeList(completionHandler: @escaping ([PostsModel]?, String?) -> Void) {
        let urlRequest = ApiHelper.createURLRequest("/posts", httpMethod: .GET)
        CustomSession<[PostsModel]>().dataTask(urlRequest, completionHandler: completionHandler )
    }
}
