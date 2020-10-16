//
//  LoginVC.swift
//  assignment1
//
//  Created by 오준현 on 2020/10/16.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
