//
//  SecondViewModel.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 19/05/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewModel {
    
//    private let responseSubject = RACSubject()
//    private let model: Model = Model()
//    
//    func retrieveFromServer() -> RACSignal {
//        
////        Alamofire.request(Router.ReadUser("leoleung")).validate().responseJSON { (request, response, result) -> Void in
////            switch result {
////            case .Success(let value):
////                print("Validation Successful")
////                let json = JSON(value)
////                print(json["bio"].stringValue)
////            case .Failure(let error):
////                print(error)
////            }
////        }
//        
//        Alamofire.request(Router.Followers("leoleung", ["page" : 1, "per_page" : 10])).validate().responseJSON { (request, response, result) -> Void in
//            var error:NSError?
//            
//            switch result {
//            case .Success(let value):
//                self.responseSubject.sendNext(value)
//                self.responseSubject.sendCompleted()
//            case .Failure(_):
//                if let statusCode = response?.statusCode {
//                    switch statusCode {
//                    case 400: error = NSError(domain: "Bad Request", code: statusCode, userInfo: nil)
//                    case 401: error = NSError(domain: "Authorization Error", code: statusCode, userInfo: nil)
//                    case 403: error = NSError(domain: "Forbidden", code: statusCode, userInfo: nil)
//                    case 404: error = NSError(domain: "Request Not Found", code: statusCode, userInfo: nil)
//                    case 410: error = NSError(domain: "Gone. The resource has been expired", code: statusCode, userInfo: nil)
//                    case 422: error = NSError(domain: "Unprocessable Entity", code: statusCode, userInfo: nil)
//                    case 500: error = NSError(domain: "Internal Server Error", code: statusCode, userInfo: nil)
//                    case 503: error = NSError(domain: "Service Unavailable", code: statusCode, userInfo: nil)
//                    default: error = NSError(domain: "", code: statusCode, userInfo: nil)
//                    }
//                }
//                self.responseSubject.sendError(error)
//            }
//        }
//        
//        return self.responseSubject
//    }
    
}