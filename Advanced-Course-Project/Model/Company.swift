//
//  Company.swift
//  Advanced-Course-Project
//
//  Created by Alfredo Fernandes on 2018-03-03.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

class Company {
    
    private var name: String?
    private var address: String?
    private var website: String?
    private var email: String?
    private var phone: String?
    private var history: String?
    private var product: String?
    private var techStack: String?
    private var sizeCompany: String?
    private var rating: Int?
    private var job: [Job]?
    
    public required convenience init(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        name        <- map["name"]
        address     <- map["address"]
        website     <- map["website"]
        email       <- map["email"]
        phone       <- map["phone"]
        history     <- map["history"]
        product     <- map["product"]
        techStack   <- map["techStack"]
        sizeCompany <- map["sizeCompany"]
        rating      <- map["rating"]
        job         <- map["job"]
    }
}
