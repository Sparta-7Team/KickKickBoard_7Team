//
//  ProfileCell.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/18/24.
//

import Foundation
import UIKit
import SnapKit

class ProfileCell: UITableViewCell {
    static let PFCidenti = "PFCell"
    
    var profileCellLabel: UILabel = {
        let profileCellLabel = UILabel()
        return profileCellLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ProfileCell.PFCidenti)
        
        addSubview(profileCellLabel)
        ProfileAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func ProfileAutoLayout() {
        profileCellLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
