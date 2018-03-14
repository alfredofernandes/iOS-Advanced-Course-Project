//
//  CompanyDetailViewController.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-09.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var techStackLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let company = CoreFacade.shared.getCompany()
        
        nameLabel.text = company.name
        emailLabel.text = company.email
        logoLabel.text = "This is a logo"
        sizeLabel.text = "1000+"
        photoLabel.text = "This is a photo"
        contactLabel.text = "647-675-3412"
        websiteLabel.text = "https://www.gcrozariol.com/"
        techStackLabel.text = "IT"
        descriptionLabel.text = "This company has been developing apps..."
    }
    
}
