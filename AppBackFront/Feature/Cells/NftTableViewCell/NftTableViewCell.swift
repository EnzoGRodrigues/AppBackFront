//
//  NftTableViewCell.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 31/10/23.
//

import UIKit
import AlamofireImage

class NftTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NftTableViewCell.self)
    
    private lazy var screen: NftTableViewCellScreen = {
        let view = NftTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    public func setupCell(data: Nft){
        if let urlNFT: URL = URL(string: data.nftImage ?? " "), let urlUser: URL = URL(string: data.userImage ?? " ") {
            /*primeiro - estamos transformando as string de urlNft e urlUser que estamos recebendo do nosso JSON em URLs.
             segundo -  usar o AlamofireImage para que ele possa fazer a tratativa das urls
             */
            screen.nftImageView.af.setImage(withURL: urlNFT, placeholderImage: UIImage(named: "trheeButtons"))
            screen.nftImageView.backgroundColor = .white
            
            screen.userImageView.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName: "person.circle.fill"))
            screen.userImageView.backgroundColor = .white
        }
        screen.priceLabel.text = data.price ?? " "
        screen.priceValueLabel.text = "\(data.nftPrice ?? 0.0) ETH"
        screen.ownedByPriceLabel.text = data.ownedBy
        screen.userLabel.text = data.userName
    }
}
