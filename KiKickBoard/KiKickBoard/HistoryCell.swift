//
//  HistoryCell.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/18/24.
//
import Foundation
import UIKit
import SnapKit

class HistoryCell: UITableViewCell {
    static let HTidenti = "HTCell"
    var upperStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    var serialLabel: UILabel = {
        let serialLabel = UILabel()
        serialLabel.font = UIFont.systemFont(ofSize: 15)
        serialLabel.textAlignment = .left
        return serialLabel
    }()
    var useInfoLabel : UILabel = {
        let useInfoLabel = UILabel()
        useInfoLabel.font = UIFont.systemFont(ofSize: 15)
        useInfoLabel.textAlignment = .left
        return useInfoLabel
    }()
    var dateInfoLabel : UILabel = {
        let dateInfoLabel = UILabel()
        dateInfoLabel.font = UIFont.systemFont(ofSize: 15)
        dateInfoLabel.textAlignment = .right
        return dateInfoLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: HistoryCell.HTidenti)
        addSubview(upperStackView)
        upperStackView.addArrangedSubview(serialLabel)
        upperStackView.addArrangedSubview(useInfoLabel)
        upperStackView.addArrangedSubview(dateInfoLabel)
        HistoryAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func HistoryAutoLayout() {
        upperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    func setHistory(model : UseHistoryModel){
        serialLabel.text = "\(model.serialNumber)"
        useInfoLabel.text = "이용 거리 : \(model.distance)  | 이용 금액 : \(model.price)"
        dateInfoLabel.text = "\(model.date)"
    }
    
}
