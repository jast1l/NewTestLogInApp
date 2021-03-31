//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by MACBOOK on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(name ?? "")"
    }
}
