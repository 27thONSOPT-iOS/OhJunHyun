//
//  MyViewController.swift
//  week4assignment
//
//  Created by 오준현 on 2020/11/09.
//

import UIKit

import RxCocoa
import RxSwift

class MyViewController: UIViewController {
    
    var disposeBag = DisposeBag()

    let imageView: UIImageView = {
       let image = UIImageView()
        
        image.image = UIImage(named: "juhyeok")
        
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20)
        label.text = "이주혁"
        label.textAlignment = .center
        
        return label
    }()
    
    let partLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20)
        label.text = "iOS 파트"
        label.textAlignment = .center

        return label
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "안녕하세요~"
        label.textAlignment = .center

        return label
    }()

    let button: UIButton = {
       let button = UIButton()
        
        button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8
        button.setTitle("로그인하러 가기", for: .normal)
        
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
        view.addSubview(helloLabel)
        view.addSubview(button)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        partLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor,
                                       constant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        partLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 20).isActive = true
        partLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        partLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        partLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        helloLabel.topAnchor.constraint(equalTo: partLabel.bottomAnchor,
                                        constant: 20).isActive = true
        helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helloLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        helloLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        button.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.rx.tap.subscribe { (next) in
            let vc = UINavigationController(rootViewController: LoginViewController())
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }.disposed(by: disposeBag)

    }

}
