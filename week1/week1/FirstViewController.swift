//
//  FirstViewController.swift
//  week1
//
//  Created by 오준현 on 2020/10/10.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var stepperLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
    }
    
    @IBAction func Stepper(_ sender: Any) {
        
        stepperLabel.text = String(Int(Stepper.value)) + "분 마다"

    }
    
    @IBAction func Switch(_ sender: Any) {
        if Switch.isOn {
            switchLabel.text = "자동갱신"
        } else {
            switchLabel.text = "자동갱신 안함"
            switchLabel.sizeToFit()
        }
    }
    
    @IBAction func moveButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {
            return
        }
        
        vc.state = switchLabel.text ?? ""
        vc.email = textField.text ?? ""
        vc.interval = stepperLabel.text ?? ""
        
        present(vc, animated: true)
    }
    
}
