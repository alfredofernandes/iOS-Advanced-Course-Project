//
//  CompanyController.swift
//  Advanced-Course-Project
//
//  Created by Caio Dias on 2018-03-06.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation

public class CompanyController {
    public static let shared: CompanyController = CompanyController()
    
    private init() {
        // Nothing :)
    }
    
    public func listCompanies() -> [Company] {
        return generateStubCompanies()
    }
    
    private func generateStubCompanies() -> [Company] {
        var stubCompanies = [Company]()
        let randomInt = Int(arc4random_uniform(16))
        
        for num in 0...randomInt {
            let company = Company(withName: "\(num)", andEmail: "\(num)@email.com")

            stubCompanies.append(company)
        }
        
        return stubCompanies
    }
}
