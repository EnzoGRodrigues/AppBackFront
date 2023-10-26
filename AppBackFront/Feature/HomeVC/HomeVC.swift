//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 24/10/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen : HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   

}
