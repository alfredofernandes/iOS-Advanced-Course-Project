//
//  Student.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Student: Mappable {
    private var name: String?
    private var goal: String?
    private var term: String?
    private var photo: String?
    private var github: String?
    private var project: String?
    private var linkedIn: String?
    private var education: String?
    private var certification: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        name            <- map["name"]
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
