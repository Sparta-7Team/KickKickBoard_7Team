//
//  ProfileVC.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/17/24.
//
import Foundation
import UIKit
import SnapKit


class ProfileVC: UIViewController {
    //private 선언을 잘하자
    private let profileVC = UITableView()
    var profileData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileVC)
        setUserData()
        profileAutoLayout()
        profileVC.dataSource = self
        profileVC.delegate = self
        profileVC.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.PFCidenti)
    
    }
    
    func profileAutoLayout() {
        profileVC.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func setUserData(){
//        let userDataList = SignUpController.shared.userInfoArray
//        if userDataList.filter({ userInfo in
//            userInfo.uid == LoginController.shared.currentUserInfo.uid
//        })
        for userList in SignUpController.shared.userInfoArray{
            if userList.uid == LoginController.shared.currentUserInfo.uid{
                profileData.append(userList.uid)
                profileData.append(userList.name)
                profileData.append(userList.password)
                profileData.append(userList.phoneNumber)
                profileData.append(userList.email)   
            }
        }
    }
    
}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return profileData.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.PFCidenti, for: indexPath) as? ProfileCell else { return UITableViewCell() }
    
    let models = profileData[indexPath.row]
    cell.profileCellLabel.text = models
    
    cell.profileCellLabel.textColor = .darkGray
    cell.backgroundColor = .clear
    cell.selectionStyle = .none
    
    return cell
}

}
