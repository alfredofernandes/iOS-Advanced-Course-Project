//
//  NetworkManager.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-13.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias studentSuccess = (Student) -> Void

class NetworkManager {
    
    class func fetchStudent(url: String, handler: @escaping studentSuccess) {
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Student>) in

            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                handler(value)
            }
            
        }
    }
}
