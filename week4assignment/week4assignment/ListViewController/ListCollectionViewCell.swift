//
//  ListCollectionViewCell.swift
//  week4assignment
//
//  Created by 오준현 on 2020/11/09.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        
        imageView.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12, weight: .bold)
        
        return label
    }()
    
    lazy var nameUnderBar: UIView = {
       let view = UIView()
        
        view.backgroundColor = UIColor(red: 252/255, green: 205/255, blue: 2/255, alpha: 1)
        
        return view
    }()
    
    lazy var hashtagLabel: UILabel = {
       let label = UILabel()
        
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 11, weight: .medium)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        setUpData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        contentView.addSubview(imageView)
        contentView.addSubview(hashtagLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameUnderBar)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        hashtagLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUnderBar.translatesAutoresizingMaskIntoConstraints = false

        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -21).isActive = true

        nameUnderBar.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15).isActive = true
        nameUnderBar.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameUnderBar.heightAnchor.constraint(equalToConstant: 3).isActive = true
        nameUnderBar.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        hashtagLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        hashtagLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        hashtagLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        hashtagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func setUpData() {
        
    }

}
