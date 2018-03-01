//
//  Company.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

class Company: Mappable {
    
    private var jobs: [Job]?
    private var name: String?
    private var size: String?
    private var photo: String?
    private var contact: String?
    private var website: String?
    private var techStack: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        jobs        <- map["jobs"]
        name        <- map["name"]
        size        <- map["size"]
        photo       <- map["photo"]
        contact     <- map["contact"]
        website     <- map["website"]
        techStack   <- map["techStack"]
    }
    
}
