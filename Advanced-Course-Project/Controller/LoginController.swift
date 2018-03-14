//
//  LoginController.swift
//  Advanced-Course-Project
//
//  Created by Araceli Teixeira on 13/03/18.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Alamofire

internal class LoginController {
    internal private(set) var token: String
    private let email: String = "prodigiadvancedcourse@gmail.com"
    private let password: String = "prodigi123!@#"
    private let loginURL: String = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyB8m7LmEtH4wNjFKEfKnaUcUUJVdp1Ntx4"
    
    internal init() {
        self.token = ""
    }

    public func doLogin(onSuccess: @escaping (String) -> Void, onFail: @escaping (Error) -> Void) {
        guard let url = URL(string: loginURL) else {
            print("Couldn't get job list")
            return
        }
        
        let httpBody = ["email": email, "password": password, "returnSecureToken" : "true"]
        
        guard let httpBodyData = try? JSONSerialization.data(withJSONObject: httpBody, options: []) else {
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = httpBodyData
        
        Alamofire.request(urlRequest).validate().responseJSON { response in
            
            switch response.result {
            case .success:
                if let data = response.data {
                    guard
                        let json = try? JSONSerialization.jsonObject(with: data, options: []),
                        let dictionary = json as? [String: Any],
                        let idToken = dictionary["idToken"] as? String
                    else {
                            print("Failed to get response data as json")
                            return
                    }
                    
                    self.token = idToken
                    onSuccess(self.token)
                }
                
            case .failure(let error):
                print("ERROR: \(error.localizedDescription)")
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
                
                onFail(error)
            }
        }
    }
}
