//
//  RegistrationVC.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/17/24.
//
import Foundation
import UIKit
import SnapKit
import NMapsMap

class RegistrationVC: UIViewController {
    private let registrationVC : UITableView = {
        let tableView = UITableView()
        tableView.register(RegistrationCell.self, forCellReuseIdentifier: RegistrationCell.RRidenti)
        return tableView
    }()
    var registrationData: [Int] = []
    var markList : [NMFMarker] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(registrationVC)
        registrationAutoLayout()
        registrationVC.dataSource = self
        registrationVC.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var serialList : [Int] = []
        var markList : [NMFMarker] = []
        for kickBoard in KickBoardData.shared.kickboards{
            serialList.append(kickBoard.serialNumber)
            markList.append(kickBoard.markerInfo)
        }
        registrationData = serialList
        self.markList = markList
    }
}


extension RegistrationVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegistrationCell.RRidenti, for: indexPath) as? RegistrationCell else { return UITableViewCell()}
        cell.registrationLabel.text = "Serial Number\(registrationData[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            KickBoardData.shared.kickboards.remove(at: indexPath.row)
            DeleteMarkInfo.shared.marks.append(self.markList[indexPath.row])
            self.registrationData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
extension RegistrationVC {
    func registrationAutoLayout() {
        registrationVC.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
