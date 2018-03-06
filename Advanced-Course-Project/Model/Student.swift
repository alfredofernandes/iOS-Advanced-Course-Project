//
//  Student.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Student: Mappable {
    public private(set) var name: String?
    public private(set) var email: String?
    public private(set) var goal: String?
    public private(set) var term: String?
    public private(set) var photo: String?
    public private(set) var github: String?
    public private(set) var project: String?
    public private(set) var linkedIn: String?
    public private(set) var education: String?
    public private(set) var certification: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        name            <- map["name"]
        email           <- map["email"]
        goal            <- map["goal"]
        term            <- map["term"]
        photo           <- map["photo"]
        github          <- map["github"]
        project         <- map["project"]
        linkedIn        <- map["linkedIn"]
        education       <- map["education"]
        certification   <- map["certification"]
    }
}
