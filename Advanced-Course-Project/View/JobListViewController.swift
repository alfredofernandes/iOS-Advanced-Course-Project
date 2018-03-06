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
    
    fileprivate let cellNameAndId: String = String(describing: JobTableCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobTable.delegate = self
        jobTable.dataSource = self
        self.jobTable.register(UINib(nibName: cellNameAndId, bundle: nil), forCellReuseIdentifier: cellNameAndId)
    }

}

extension JobListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreFacade.shared.fetchJobs().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let job = CoreFacade.shared.fetchJobs()[indexPath.row]
        let rawCell = tableView.dequeueReusableCell(withIdentifier: cellNameAndId)
        
        guard let jobCell = rawCell as? JobTableCell else {
            //TODO: log error
            return rawCell!
        }
        
        jobCell.setJobTitle(job.title!)
        jobCell.setCompany("Company \(indexPath.row)")
        jobCell.setDate(job.postingDate!)
        
        return jobCell
    }
}

extension JobListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let job = CoreFacade.shared.fetchJobs()[indexPath.row]
        
        let alert = UIAlertController(title: job.title, message: job.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
