//
//  CoreFacade.swift
//  Advance-Course-Project
//
//  Created by Caio Dias on 2018-02-28.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation

public class CoreFacade {
    private let studentController: StudentController
    private let jobController: JobController
    
    public var listOfStudents: [Student] {
        return self.studentController.students
    }
    
    // MARK: Singleton
    public static let shared: CoreFacade = CoreFacade()
    
    private init() {
        self.studentController = StudentController()
        self.jobController = JobController()
    }
    
    // MARK: Public Methods
    public func testArchitecture() -> String {
        return self.studentController.stubMethod()
    }
    
    public func fetchJobs() -> [Job] {
        return self.jobController.fetchJobs()
    }
    
    public func getJob() -> Job {
        return self.jobController.fetchJob()
    }
}
