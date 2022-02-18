//
//  CustomSession.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import Foundation

enum HTTPMethod: String {
        case GET = "GET"
        case POST = "POST"
        case DELETE = "DELETE"
        case PUT = "PUT"
    }

class CustomSession<T:Codable> {
    private var session:URLSession!
    private let decoder = JSONDecoder()
    private let defaultError = "Servis dönüşü hatalı"
    
    init() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 10.0
        sessionConfig.timeoutIntervalForResource = 600.0
        session = URLSession(configuration: sessionConfig)
    }
    
    func dataTask(_ urlRequest:URLRequest,completionHandler: @escaping (T?, String?) -> Void) {
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error -> Void in
            
            guard let data = data, let response = response else{
                if let error = error{
                    completionHandler(nil,error.localizedDescription)
                }else{
                    completionHandler(nil,self.defaultError)
                }
                return
            }
            
            if let message = self.getResult(response: response){
                completionHandler(nil,message)
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? T {
                    print(json)
                    }
                
                let response = try self.decoder.decode(T.self, from: data)
                
                completionHandler(response,nil)
            }catch{
                completionHandler(nil,error.localizedDescription)
            }
        })
        
        task.resume()
    }
    
    func getResult(response:URLResponse) -> String? {
        let httpResponse = response as! HTTPURLResponse
        
        if httpResponse.statusCode == 200 || httpResponse.statusCode == 201{
            return nil
        }
        return getStatusError(httpResponse.statusCode)
    }
    
    func getStatusError(_ statusCode:Int) -> String{
        switch (statusCode) {
            case 400:
                return "İstek hatalı !"
            case 401:
                return "Kimlik doğrulaması yapılamadı !"
            case 404:
                return "Sunucuya bağlanılamadı !"
            case 405:
                return "Sunucu , HTTP Method'u kabul etmiyor !"
            case 406:
                return "İstemcinin Accept header'ında verilen özellik karşılanamıyor !"
            case 500:
                return "Sunucuda bir hata oluştu ve istek karşılanamadı !"
            case 501:
                return "Sunucu istenilen isteği yerine getirecek şekilde yapılandırılmamıştır !"
            case 502:
                return "Gateway veya Proxy sunucusu, kaynağın bulunduğu sunucudan cevap alamıyor !"
            default:
                return "\(statusCode) Bilinmeyen Hata"
        }
    }
}

class ApiHelper {
    private static let baseURL = "https://jsonplaceholder.typicode.com"
    static func createURLRequest(_ url:String, httpMethod: HTTPMethod) -> URLRequest{
        var urlRequest = URLRequest(url:  URL(string:(baseURL + url).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!, timeoutInterval: Double.infinity)
        urlRequest.httpMethod = httpMethod.rawValue
        print("url request : \(urlRequest)")
        return urlRequest
    }
}
