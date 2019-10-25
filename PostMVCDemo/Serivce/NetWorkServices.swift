//
//  NetWorkServices.swift
//  PostMVCDemo
//
//  Created by User on 31/05/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation

import Alamofire
import SVProgressHUD
import SwiftyJSON

protocol passdataDelegate {
    func passData(ArrayOfPosts: [Post])
}
class NetWorkServices {
    
    private init(){}
    
    static let shared = NetWorkServices()
    private var sessionManager = Alamofire.SessionManager()
    
    var postArray : [Post] = []
    var delegate: passdataDelegate? = nil
    
    func getArticalData(){
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 100
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        
        SVProgressHUD.show()
        self.sessionManager.request(post_Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            
            .responseJSON { response in
                SVProgressHUD.dismiss()
                switch response.result{
                    
                case .success(let value):
                    let json = JSON(value)
                    json.array?.forEach({ (post) in
                        let postData = Post(userId: post["userId"].intValue, id: post["id"].intValue, title: post["title"].stringValue, desc: post["body"].stringValue)
                        self.postArray.append(postData)
                    })
                    self.delegate?.passData(ArrayOfPosts: self.postArray)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
   
}
