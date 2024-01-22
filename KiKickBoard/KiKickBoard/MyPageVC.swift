//
//  MyPageVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit
import SnapKit
import SwiftUI
class MyPageVC: UIViewController {
    
    //cell label
    var models: [String] = ["킥보드 미사용", "회원정보", "이용내역", "등록한 킥보드", "로그아웃"]
    var kickBoardUseStatus = false
    private let myPageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        //셀끼리 간격
        layout.minimumLineSpacing = 1
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageCollectionView.dataSource = self
        myPageCollectionView.delegate = self
        
        myPageAddSubView()
        myPageCollectionViewAutoLayout()
        configureMyPageCollectionView()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.kickBoardUseStatus = UseStatusData.shared.status
        myPageCollectionView.reloadData()
    }
    
    func myPageAddSubView() {
        self.view.addSubview(myPageCollectionView)
    }
    
    func myPageCollectionViewAutoLayout() {
        myPageCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureMyPageCollectionView() {
        myPageCollectionView.register(MyPageCell.self, forCellWithReuseIdentifier: MyPageCell.MPCidenti)
    }
}

extension MyPageVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //셀 설정 및 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageCell.MPCidenti, for: indexPath) as! MyPageCell
        cell.setMypageLabel(model: models[indexPath.item])
        if indexPath.item == 0 {
            cell.myPageLabel.text = kickBoardUseStatus ? "킥보드 이용중" : "킥보드 미사용"
            cell.backgroundColor = UIColor(named: "PrimaryColor")
            cell.myPageLabel.textAlignment = .center
            cell.myPageLabel.font = UIFont.systemFont(ofSize: 25)
            cell.layer.cornerRadius = 0
            cell.myPageLabel.sizeToFit()
        }else{
            cell.backgroundColor = UIColor.gray
        }
        

        return cell
    }
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    //셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 여기서 cell 생성 X
        return CGSize(width: collectionView.safeAreaLayoutGuide.layoutFrame.width - 30, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 1: navigationController?.pushViewController(ProfileVC(), animated:true)
        case 2: navigationController?.pushViewController(HistoryVC(), animated:true)
        case 3: navigationController?.pushViewController(RegistrationVC(), animated: true)
        case 4: let alertController = UIAlertController(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Yes", style: .default, handler: { _ in // 핸들러로 rootView로 이동
                let LoginVC = UINavigationController.init(rootViewController: LoginVC())
                self.view.window?.rootViewController = LoginVC 
            })
            let cancel = UIAlertAction(title: "No", style: .cancel)
            
            alertController.addAction(cancel)
            alertController.addAction(ok)
            
            present(alertController, animated: true, completion: nil)
    
        default: break
        }

        }
        
        
    }
    

