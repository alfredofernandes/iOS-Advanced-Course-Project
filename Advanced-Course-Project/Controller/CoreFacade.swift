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
    
    public var listOfStudents: [Student] {
        return self.studentController.students
    }
    
    // MARK: Singleton
    public static let shared: CoreFacade = CoreFacade()
    
    private init() {
        self.studentController = StudentController()
    }
    
    // MARK: Public Methods
    
    public func testArchitecture() -> String {
        return self.studentController.stubMethod()
    }
}
