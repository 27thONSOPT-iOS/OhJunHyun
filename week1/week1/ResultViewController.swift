//
//  ResultViewController.swift
//  week1
//
//  Created by 오준현 on 2020/10/10.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var autoStateLabel: UILabel!
    @IBOutlet weak var intervalLabel: UILabel!
    
    var email: String = ""
    var state: String = ""
    var interval: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        emailLabel.text = email
        emailLabel.sizeToFit()
        autoStateLabel.text = state
        autoStateLabel.sizeToFit()
        intervalLabel.text = interval
        intervalLabel.sizeToFit()
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
