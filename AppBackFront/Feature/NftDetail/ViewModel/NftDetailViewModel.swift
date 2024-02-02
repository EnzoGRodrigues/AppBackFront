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
    
    public func heightForRowAt(IndexPath: IndexPath, width: CGFloat) -> CGFloat {
        switch NameCellNftDetail(rawValue: IndexPath.row){
        case .nftImage:
            return 400
        case.description:
            return nftDescription.height(withConstrainedWidth: width-40 , font: UIFont.systemFont(ofSize: 18)) + 89
        default:
            return 0
        }
    }

}
