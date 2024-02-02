//
//  NftDetailViewModel.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 12/12/23.
//

import UIKit

class NftDetailViewModel {
    
    let nft: Nft
    
    init(nft: Nft){
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 2
    }
    
    public var nftImage: String{
        return nft.nftImage ?? " "
    }
    
    public var idNft: Int{
        return nft.nftID ?? 0
    }
    
    public var nftTitle: String{
        return nft.nftNameImage ?? " "
    }
    
    public var nftDescription: String{
        return nft.nftDescription ?? " "
    }

}
