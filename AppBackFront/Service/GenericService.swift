//
//  GenericService.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 26/10/23.
//

import Foundation
import Alamofire

enum Error: Swift.Error{ //enum de erros.
    case fileNotFound(name: String) //erro para encontrar os arquivos
    case fileDecodingFailed(named: String, Swift.Error) //erro de decoding dos arquivos
    case errorRequest(AFError) //erro de request
}

protocol GenericService: AnyObject{
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void /*
                                                                         O typealias serve para "chamar alguem pelo apelido". Ao invés de chamar alguem pelo nome completo, nós chamamos alguém pelo apelido, e é isso que acontece com o typealias, ao inves de ter todo esse trecho de código (_ result: T, _ failure: Error?) -> Void, eu chamo somente o completion, porque o completion vai conter todo o código nele. Ou seja, o completion é o apelido do código.
                                                                         */
}
