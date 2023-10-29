//
//  NftFilterCollectionViewCell.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 29/10/23.
//

import UIKit

class NftFilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: NftFilterCollectionViewCell.self) //o que estamos dizendo aqui é que qualquer objeto que eu passar no construtor, ele irá transformar em uma string. é mais seguro para caso algum dia eu altere o nome da minha classe.
    
    private lazy var screen: NftFilterCollectionViewCellScreen = {
        let view = NftFilterCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        contentView.addSubview(screen)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(filter: FilterNft){
        screen.filterLabel.text = filter.title ?? " "
        if filter.isSelected ?? false {
            screen.filterLabel.backgroundColor = .purple
        }else {
            screen.filterLabel.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        }
    }
    
}
