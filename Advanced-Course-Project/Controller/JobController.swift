//
//  JobController.swift
//  Advanced-Course-Project
//
//  Created by Araceli Teixeira on 04/03/18.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

internal class JobController {
    internal private(set) var job: Job!
    
    internal fileprivate(set) var jobList: [Job] {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNOTIFICATION_JOB_LIST_CHANGED), object: nil)
        }
    }
    
    internal init() {
        self.jobList = []
        self.job = generateStubJob()
    }
    
    public func fetchJob() -> Job {
        return job
    }
    
    public func fetchJobs() {
        guard let url = URL(string: "https://jobs.github.com/positions.json?search=mobile") else {
            print("Couldn't get job list")
            return
        }
        
        Alamofire.request(url).responseArray { (response: DataResponse<[Job]>) in
            if let jobArray = response.result.value {
                self.jobList = jobArray
            }
        }
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
}
