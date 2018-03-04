//
//  Job.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

class Job: Mappable {
    
    public private(set) var title: String?
    public private(set) var salary: String?
    public private(set) var benefits: String?
    public private(set) var startDate: String?
    public private(set) var postingDate: String?
    public private(set) var description: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title       <- map["title"]
        description <- map["description"]
        startDate   <- map["startDate"]
        postingDate <- map["postingDate"]
        salary      <- map["salary"]
        benefits    <- map["benefits"]
    }
    
}

