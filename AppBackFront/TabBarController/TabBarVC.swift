//
//  TabBarVC.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 24/10/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar(){
        
        let home = UINavigationController(rootViewController: HomeVC()) //criando uma constante que armazera a Home da minha UINavigationController
        setViewControllers([home], animated: false) //setando um array de Navigations, no array devemos passar todas as telas da tabBar.
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        guard let items  = tabBar.items else { return }
        items[0].image = UIImage(systemName: "trash")
    }

}
