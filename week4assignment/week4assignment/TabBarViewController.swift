//
//  TabBarViewController.swift
//  week4assignment
//
//  Created by 오준현 on 2020/11/08.
//

import UIKit

class TabBarViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var navigationController: UINavigationController

        let loginVC = MyViewController()
        let loginTabItem = UITabBarItem(title: "로그인",
                                       image: UIImage(systemName: "house"),
                                       tag: 0)
        loginVC.tabBarItem = loginTabItem
        navigationController = UINavigationController(rootViewController: loginVC)

        let LoginTab = navigationController
        
        let listVC = ListViewController()
        let listTabItem = UITabBarItem(title: "리스트",
                                       image: UIImage(systemName: "eyes"),
                                       tag: 1)
        listVC.tabBarItem = listTabItem
        
        let ListTab = listVC
        
        self.viewControllers = [LoginTab, ListTab]
    }
    
}
