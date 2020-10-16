//
//  SignUpVC.swift
//  assignment1
//
//  Created by 오준현 on 2020/10/16.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
