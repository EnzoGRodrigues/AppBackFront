//
//  AlertController.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 24/10/23.
//

import UIKit

class AlertController: NSObject {
    
    var controller : UIViewController //criando var controller que é do tipo UIViewController
    
    init(controller: UIViewController) { //contrutor para iniciar a controller. Criamos a controller para podera acessar o método PRESENT (que está na linha 24), apenas quem é uma UIViewController pode acessar esse método.
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil){ //o meu completion funciona assim: caso o usuário pressione no botão "OK" ele vai disparar o que está dentro do bloco de código da linha 20. Mas o completion é opcional, então eu posso usa-lo ou não.
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { share in //quando o usuário pressiona o botão, ele dispara o que está dentro das chaves {}
            completion?() //como eu passo o completion aqui, eu posso chamar ele em diversos lugares do app e posso atribuir função diferentes para ele, quando o usuário apertar o botão vai executar o completion que eu setei para aquele botão. O completion é chamado e setado dentro das classes.
        }
        alertController.addAction(ok) //adicionando o botão ok
        self.controller.present(alertController, animated: true) //dizendo que ela vai apresentar na tela
        
    }

}
