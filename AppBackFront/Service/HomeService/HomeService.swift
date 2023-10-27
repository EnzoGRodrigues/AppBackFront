//
//  HomeService.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 26/10/23.
//

import UIKit

protocol HomeServiceDelegate: GenericService{
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
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
