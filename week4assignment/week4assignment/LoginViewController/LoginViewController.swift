//
//  LoginViewController.swift
//  week4assignment
//
//  Created by 오준현 on 2020/11/08.
//

import UIKit

import RxSwift
import RxCocoa
import RxKeyboard

class LoginViewController: UIViewController {
    
    var disposeBag = DisposeBag()

    let imageView: UIImageView = {
       let image = UIImageView()
        
        image.image = UIImage(named: "juhyeok")
        
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20)
        label.text = "이름"
        label.textAlignment = .center
        
        return label
    }()
    
    let partLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20)
        label.text = "파트"
        label.textAlignment = .center

        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    let partTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        textField.layer.cornerRadius = 8
        return textField
    }()

    let button: UIButton = {
       let button = UIButton()
        
        button.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        button.layer.cornerRadius = 8
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.textColor = .yellow
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLayout()
    }
    
    func setUpLayout() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(partLabel)
        view.addSubview(nameTextField)
        view.addSubview(partTextField)
        view.addSubview(button)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        partLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        partTextField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor,
                                       constant: 200).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 40).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: nameTextField.leadingAnchor,
                                            constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 40).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor,
                                               constant: -30).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true

        partTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,
                                       constant: 20).isActive = true
        partTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor,
                                               constant: -30).isActive = true
        partTextField.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        partTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        partLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,
                                       constant: 20).isActive = true
        partLabel.trailingAnchor.constraint(equalTo: partTextField.leadingAnchor,
                                            constant: -10).isActive = true
        partLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true


        button.topAnchor.constraint(equalTo: partLabel.bottomAnchor, constant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true

        button.rx.tap.subscribe { (next) in
            self.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)

        RxKeyboard.instance.visibleHeight
          .drive(onNext: { [weak self] keyboardVisibleHeight in
            guard let `self` = self else {return}
                
            UIView.animate(withDuration: 1) {
                self.imageView.transform = CGAffineTransform(translationX: 0,
                                                             y: -keyboardVisibleHeight/2)
                self.nameLabel.transform = CGAffineTransform(translationX: 0,
                                                             y: -keyboardVisibleHeight/2)
                self.nameTextField.transform = CGAffineTransform(translationX: 0,
                                                             y: -keyboardVisibleHeight/2)
                self.partLabel.transform = CGAffineTransform(translationX: 0,
                                                             y: -keyboardVisibleHeight/2)
                self.partTextField.transform = CGAffineTransform(translationX: 0,
                                                             y: -keyboardVisibleHeight/2)
            }
            self.view.layoutIfNeeded()
          }).disposed(by: disposeBag)
        
        nameTextField.rx.controlEvent(.editingDidEndOnExit).subscribe().disposed(by: disposeBag)
        partTextField.rx.controlEvent(.editingDidEndOnExit).subscribe().disposed(by: disposeBag)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        self.view.endEditing(true)
        
    }

}
