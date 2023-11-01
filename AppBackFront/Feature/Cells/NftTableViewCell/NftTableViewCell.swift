//
//  NftTableViewCell.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 31/10/23.
//

import UIKit

class NftTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NftTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
