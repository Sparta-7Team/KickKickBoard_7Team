//
//  HistoryVC.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/17/24.
//
import Foundation
import UIKit
import SnapKit


class HistoryVC: UIViewController {
    
    private let historyVC = UITableView()
    
    //데이터 받아오기. 날짜는 어떻게 받아오지?
    var historyData: [UseHistoryModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(historyVC)
        historyAutoLayout()
        
        historyVC.delegate = self
        historyVC.dataSource = self
        historyVC.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.HTidenti)
    }
    
    func historyAutoLayout() {
        historyVC.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.historyData = UseHistoryData.shared.historyList
    }

}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.HTidenti , for: indexPath) as? HistoryCell else { return UITableViewCell() }
        
        cell.setHistory(model: historyData[indexPath.row])
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
}
