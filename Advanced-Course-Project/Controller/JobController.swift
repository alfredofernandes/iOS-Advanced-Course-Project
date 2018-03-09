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
    internal private(set) var job: Job!
    
    internal init() {
        self.jobs = generateStubJobs()
        self.job = generateStubJob()
    }
    
    public func fetchJob() -> Job {
        return job
    }
    
    public func fetchJobs() -> [Job] {
        return jobs
    }
    
    private func generateStubJob() -> Job {
        let job = Job()
        
        job.setTitle("Software Engineer")
        job.setSalary("$120,000.00")
        job.setBenefits("Health Care and $10,000.00 anual bonus")
        job.setStartDate("01/05/2018")
        job.setPostingDate("01/03/2018")
        job.setDescription("This role expects the candidate to be an expert in...")
        
        return job
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
