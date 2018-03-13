//
//  CoreFacade.swift
//  Advance-Course-Project
//
//  Created by Caio Dias on 2018-02-28.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation

public class CoreFacade {
    
    private let jobController: JobController
    private let studentController: StudentController
    private let companyController: CompanyController
    private let loginController: LoginController
    
    public var listOfStudents: [Student] {
        return self.studentController.students
    }
    
    // MARK: Singleton
    public static let shared: CoreFacade = CoreFacade()
    
    private init() {
        self.jobController = JobController()
        self.studentController = StudentController()
        self.companyController = CompanyController.shared
        self.loginController = LoginController()
    }
    
    // MARK: Public Methods
    public func testArchitecture() -> String {
        return self.studentController.stubMethod()
    }
    
    public func fetchJobs() {
        self.jobController.fetchJobs()
    }
    
    public func getJobList() -> [Job] {
        return self.jobController.jobList
    }
    
    public func getJob() -> Job {
        return self.jobController.fetchJob()
    }
    
    public func getCompany() -> Company {
        return self.companyController.generateStubCompany()
    }
    
    public func doLogin() {
        return self.loginController.doLogin()
    }
}
