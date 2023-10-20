//
//  UIViewController + Extension.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 14/10/23.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissKeyboard(){ //função feita para abaixar o teclado na tela do celular.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}
