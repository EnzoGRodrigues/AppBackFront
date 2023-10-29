//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 24/10/23.
//

import UIKit



class HomeVC: UIViewController {
    
    var screen : HomeScreen?
    var viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.mock)
        //a assinatura de protocolos da collectionView não pode ficar no viewDidLoad pq quando trabalhamos com .request, as requisições trabalham de forma assíncrona. Ou seja, eu não sei quando que vai ter as informações necessárias para popular minha célula. Dessa mandeira, eu coloco na função success que eu criei no HomeViewModelDelegate, porque ali eu tenho certeza de que já tem informações necessárias para popular minha célula.
    }
}

extension HomeVC: HomeViewModelDelegate{
    func success() {
        print(#function)
        screen?.configCollectionViewProtocols(delegate: self, dataSource: self)
    }
    
    func error() {
        print(#function)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInsection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftFilterCollectionViewCell.identifier, for: indexPath) as? NftFilterCollectionViewCell
        cell?.setupCell(filter: viewModel.loadCurrentFilterNft(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt
    }
    
    
}
