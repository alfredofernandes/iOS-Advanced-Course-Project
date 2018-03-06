//
//  JobController.swift
//  Advanced-Course-Project
//
//  Created by Araceli Teixeira on 04/03/18.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Darwin
import ObjectMapper

internal class JobController {
    internal private(set) var jobs: [Job]!
    
    internal init() {
        self.jobs = generateStubJobs()
    }
    
    public func fetchJobs() -> [Job] {
        return jobs
    }
    
    private func generateStubJobs() -> [Job] {
        var stubJobs = [Job]()
        let randomInt = Int(arc4random_uniform(16))
        
        for i in 0...randomInt {
            let job = Job()
            job.setTitle("Title of job \(i)")
            job.setDescription("Description of job \(i)")
            job.setPostingDate("\(10+i)/0\(1+i/8)/2018")
            stubJobs.append(job)
        }
        
        return stubJobs
    }
}
