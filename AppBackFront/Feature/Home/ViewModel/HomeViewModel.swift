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
    private var searchNftData: NFTData? //criando duas listas que são do tipo NFTData porque eu preciso de uma que sempre tenha todo o conteúdo. a outra terá todo o conteúdo até que seja solicitado um filtro, a partir disso ela irá trabalhar somente com o que o usuário solicitou no filtro.
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
                    self.searchNftData = result
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
                    self.searchNftData = result
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
        return searchNftData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft{
        return searchNftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    // MARK: - NftTableViewCell
    
    public var numberOfRowsInsection: Int{
        return searchNftData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNft(indexPath: IndexPath) -> Nft{
        return searchNftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public var heightForRowAt: CGFloat {
        return 360
    }
    
    // MARK: - Filter
    
    var typeFilter: Int? {
        return searchNftData?.filterListNft?.first(where: {$0.isSelected == true})?.id
    }
    
    public func filterSearchText(_ text: String){ //método para usar na pesquisa de texto.
        
        var nftList: [Nft] = []
        //criando filtro para que possa pegar todos os types iguais e exibir para mim na tela depois de eu clicar no filtro.
        if typeFilter == 0 { //se caso o meu type for zero
            nftList = nftData?.nftList ?? [] // me retorna a minha lista completa
        }else {
            nftList = nftData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? [] // caso contrário, me restorne o filtro com o tipo que eu selecionei
        }
        
        //criando filtro que depois de clicado e separado todos os types iguais, eu possa filtrar, nessa nova lista criada, pelo que esrá escrito.
        if text.isEmpty {
            searchNftData?.nftList = nftList
        }else{
            searchNftData?.nftList = nftList.filter({ nft in //to pensando o nftData.nftList e fazendo um filtro dele. Onde eu digo que de acordo com o nome do usuário, ou seja, olha para o nome do usuário e vê se o texto que contem nele (.contains) é igual ao texto que eu digitei pra você (o text passado no parametro)
                //o retorno dessa pesquisa será atribuida ao meu searchNftData. por isso eu tenho que alterar para searchNftData em todas as outras partes do código acima, porque quando voltar no meu numberOfRowsInsection por exemplo, ele terá que me dar todas as linhas da minha pesquisa e não todas as linhas de tudo o que eu tenho. o nftData é TUDO o que eu tenho. O searchNftData é o resultado do filtro, da pesquisa q o usuário fez em cima de tudo o que eu tenho, em cima do nftData.
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }
    
    public func setFilter(indexPath: IndexPath, searchText: String){
        var filterNft: [FilterNft] = []
        for (index, value) in (searchNftData?.filterListNft ?? []).enumerated(){
            var type = value //crio essa variável porque o nosso value ele é o filterNft completo. e o meu value ele é por padrão do tipo let, então não pode ser alterado, por isso crio uma variável que recebe o value para poder acessar o isSelect e alterar o valor dele.
            if index == indexPath.row{ //se a posição que eu selecionei é a mesma posição que o for está percorrendo, então ele irá transformar o "isSelected" em true e irá selecionar o filtro correto.
                type.isSelected = true
            }else{
                type.isSelected = false
            }
            filterNft.append(type)
        }
        searchNftData?.filterListNft = filterNft
        filterSearchText(searchText)
    }
}
