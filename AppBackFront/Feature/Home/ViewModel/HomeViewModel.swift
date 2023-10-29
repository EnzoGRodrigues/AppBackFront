//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 26/10/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject{
    func success()
    func error()
}

class HomeViewModel {
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    weak private var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate?){
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch){
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result{
                    print("success")
                    self.nftData = result
                    self.delegate?.success()
                }else{
                    print("failure")
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result{
                    print("success")
                    self.nftData = result
                    self.delegate?.success()
                }else{
                    print("failure")
                    self.delegate?.error()
                }
            }
        }
    }
    
    // MARK: - FilterCollectionView
    
    public var numberOfItemsInsection: Int {
        return nftData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft{
        return nftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
}
