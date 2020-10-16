//
//  ViewController.swift
//  week1
//
//  Created by 오준현 on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var voteButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moveButton.addTarget(self, action: #selector(didTapMoveButton), for: .touchUpInside)
    }

    @IBAction func voteAction(_ sender: Any) {
        nameLabel.text = "27기 iOS 파트장 이주혁"
        nameLabel.sizeToFit()
    }
    
    @objc
    func didTapMoveButton(){
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else { return }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
}

