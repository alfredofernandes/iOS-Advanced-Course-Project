//
//  Job.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

class Job: Mappable {
    
    private var title: String?
    private var salary: String?
    private var benefits: String?
    private var startDate: String?
    private var postingDate: String?
    private var description: String?
    
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
