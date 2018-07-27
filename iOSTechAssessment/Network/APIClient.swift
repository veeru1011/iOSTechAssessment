//
//  APIClient.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import Foundation

struct APIURL {
    static let baseURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=1f4d59c214724c859c0a7e66828ddc45"
}

class APIClient: NSObject {
    
    private static var sharedInstance: APIClient = {
        let apiManager = APIClient(baseURL: APIURL.baseURL)
        return apiManager
    }()
    
    let baseURL: String
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    private override init() {
        self.baseURL = APIURL.baseURL
    }
    
    class func shared() -> APIClient {
        return sharedInstance
    }
    
    // Fetching data from server
    func getData(completionHandler:@escaping(Bool,ResultModel?,String) -> Void) -> Void  {
        let urlString = self.baseURL 
        let request = URLRequest(url: URL(string: urlString)!)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let userlist = try decoder.decode(ResultModel.self, from: data)
                completionHandler(true,userlist,"")
                
            } catch let err {
                completionHandler(false,nil,err.localizedDescription)
            }
        })
        task.resume()
    }
}
