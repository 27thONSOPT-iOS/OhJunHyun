//
//  ViewController.swift
//  week3
//
//  Created by 오준현 on 2020/10/31.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {

    lazy var pickerView: UIPickerView = {
       let pickerView = UIPickerView()
        
        return pickerView
    }()
    
    lazy var label: UILabel = {
       let label = UILabel()
        
        label.text = text[0]
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        
        return tableView
    }()
    
    let text: [String] = ["이주혁", "최승준", "이윤진", "오준현", "이원석"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
//        view.backgroundColor = .lightGray
//        view.addSubview(label)
//        view.addSubview(pickerView)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
//        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        pickerView.translatesAutoresizingMaskIntoConstraints = false
//        pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        pickerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        pickerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

//        pickerView.dataSource = self
//        pickerView.delegate = self
        
        
    }


}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = text[indexPath.row]
        
        return cell
    }
    
    
}
//extension ViewController: UIPickerViewDelegate {
//
//}
//
//extension ViewController: UIPickerViewDataSource {
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        label.text = text[row]
//    }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return text[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//        return text.count
//    }
//
//
//}

