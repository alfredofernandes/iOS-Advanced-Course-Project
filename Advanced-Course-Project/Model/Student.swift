//
//  Student.swift
//  Advanced-Course-Project
//
//  Created by Alfredo Fernandes on 2018-03-03.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

class Student: Mappable {
    
    private var name: String?
    private var email: String?
    private var phone: String?
    private var photo: String?
    private var linkedin: String?
    private var github: String?
    private var skills: String?
    private var goals: String?
    private var projectsDone: String?
    private var programTranscript: String?
    private var previousTraining: String?
    private var volunteeringExpierence: String?
    private var workStatusInCanada: String?
    
    public required convenience init(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        name                    <- map["name"]
        email                   <- map["email"]
        phone                   <- map["phone"]
        photo                   <- map["photo"]
        linkedin                <- map["linkedin"]
        github                  <- map["github"]
        skills                  <- map["skills"]
        goals                   <- map["goals"]
        projectsDone            <- map["projectsDone"]
        programTranscript       <- map["programTranscript"]
        previousTraining        <- map["previousTraining"]
        volunteeringExpierence  <- map["volunteeringExpierence"]
        workStatusInCanada      <- map["workStatusInCanada"]
    }
}
