//
//  Job.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Job: Mappable {
    
    public private(set) var title: String?
    public private(set) var salary: String?
    public private(set) var benefits: String?
    public private(set) var startDate: String?
    public private(set) var postingDate: String?
    public private(set) var description: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        title       <- map["title"]
        description <- map["description"]
        startDate   <- map["startDate"]
        postingDate <- map["postingDate"]
        salary      <- map["salary"]
        benefits    <- map["benefits"]
    }
    
    public func setTitle(_ title: String) {
        self.title = title
    }
    
    public func setDescription(_ description: String) {
        self.description = description
    }
    
    public func setStartDate(_ startDate: String) {
        self.startDate = startDate
    }
    
    public func setPostingDate(_ postingDate: String) {
        self.postingDate = postingDate
    }
    
    public func setSalary(_ salary: String) {
        self.salary = salary
    }
    
    public func setBenefits(_ benefits: String) {
        self.benefits = benefits
    }
}
