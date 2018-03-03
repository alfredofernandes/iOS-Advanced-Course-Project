//
//  Company.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Company: Mappable {
    
    private var jobs: [Job]?
    private var name: String?
    private var logo: String?
    private var size: String?
    private var contact: String?
    private var website: String?
    private var techStack: String?
    private var description: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        jobs        <- map["jobs"]
        name        <- map["name"]
        logo        <- map["logo"]
        size        <- map["size"]
        contact     <- map["contact"]
        website     <- map["website"]
        techStack   <- map["techStack"]
        description <- map["description"]
    }
    
}
