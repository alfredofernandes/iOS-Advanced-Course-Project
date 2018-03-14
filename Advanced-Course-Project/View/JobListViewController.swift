//
//  JobListViewController.swift
//  Advanced-Course-Project
//
//  Created by Araceli Teixeira on 04/03/18.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import UIKit

class JobListViewController: UIViewController {
    @IBOutlet weak var jobTable: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    fileprivate let cellNameAndId: String = String(describing: JobTableCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobTable.isHidden = true
        jobTable.delegate = self
        jobTable.dataSource = self
        self.jobTable.register(UINib(nibName: cellNameAndId, bundle: nil), forCellReuseIdentifier: cellNameAndId)
        
        NotificationCenter.default.addObserver(self, selector: #selector(JobListViewController.updateTableList),
                                               name: NSNotification.Name(rawValue: kNOTIFICATION_JOB_LIST_CHANGED), object: nil)
        CoreFacade.shared.fetchJobs()
        
        NetworkManager.fetchStudent(
        url: "https://pro-digi-advanced.firebaseio.com/student/studentId.json?auth=eyJhbGciOiJSUzI1NiIsImtpZCI6IjQzZTFiMGIyOTllNDIxZjU2ZWI1YTQ2NjhkMWNmMjNmNGFjNjk2NGMifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvLWRpZ2ktYWR2YW5jZWQiLCJhdWQiOiJwcm8tZGlnaS1hZHZhbmNlZCIsImF1dGhfdGltZSI6MTUyMDk4MjM1MiwidXNlcl9pZCI6IklIbUtSRFM5SjJhMmhxWXNPa1dOZVpXQU5RMjIiLCJzdWIiOiJJSG1LUkRTOUoyYTJocVlzT2tXTmVaV0FOUTIyIiwiaWF0IjoxNTIwOTgyMzUyLCJleHAiOjE1MjA5ODU5NTIsImVtYWlsIjoicHJvZGlnaWFkdmFuY2VkY291cnNlQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJwcm9kaWdpYWR2YW5jZWRjb3Vyc2VAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.EC2vB9Kl51rKdhv-c-GSXgfvkEOZdccX_mSvhKGTJf5wzMIIUUbv_J_2PUg9R-c79O8I0Ow_Mb06Xx8jNRTjbWtpBRKV8sJn-vvdVOpNf8DyYX47OxG0sxgCUJJh3Hd5Gz4AJayz2FeebHTazUIiNQMcZrbFWMLFPCVfs_sfNFyrCfZUQRXvogYqCevxddUFzCoO50JO2X0E5T8Zi-6dATxiS1OYq1wL87Qb25N73jeGVpwQoql53SXaAqi18B_sjcS1hcMtAfypPLwUL0gr9U90nngb003sbWcvqBj2QahtEbi_1tz4opqJ2W5R2LiwFIjdVSf2C2Tvb9fULBh5Sw") { (studentSuccess) in
            
            print(studentSuccess.name ?? "No value")
            
        }
    }
    
    @objc func updateTableList() {
        DispatchQueue.main.async {
            self.jobTable.reloadData()
            self.jobTable.contentOffset = .zero
            
            self.spinner.stopAnimating()
            self.jobTable.isHidden = false
        }
    }
}

extension JobListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreFacade.shared.getJobList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
//        let job = CoreFacade.shared.getJobList()[indexPath.row]
        let rawCell = tableView.dequeueReusableCell(withIdentifier: cellNameAndId)
        
        guard let jobCell = rawCell as? JobTableCell else {
            //TODO: log error
            return rawCell!
        }
        
        jobCell.setJobTitle("Title")
        jobCell.setCompany("Company \(indexPath.row)")
        jobCell.setDate("Posting Date")
        
        return jobCell
    }
}

extension JobListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showJobDetail", sender: nil)
    }
}
