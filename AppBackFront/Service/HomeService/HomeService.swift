//
//  HomeService.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 26/10/23.
//

import UIKit
import Alamofire

protocol HomeServiceDelegate: GenericService{
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
    
    func getHome(completion: @escaping completion<NFTData?>) {
        let url: String = "https://run.mocky.io/v3/ddfe107b-968f-4883-ac02-290a485b00e6"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response in //essa linha de código usando o alamofire para umr requisição é padrão.
            debugPrint(response)
            switch response.result{
            case .success(let success):
                print("Success -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("Error -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
            
        }
        
    }
    
    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData, nil)
            }catch{
                completion(nil, Error.fileDecodingFailed(named: "HomeData", error))
            }
        }else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
    
    
}
