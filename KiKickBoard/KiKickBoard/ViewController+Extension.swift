//
//  ViewController+Extension.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/18.
//

import Foundation
import UIKit
extension UIViewController {
    func keyBoardHide(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyBoard(){
        view.endEditing(true)
    }
    func changeStatusBarBgColor(bgColor: UIColor?) {
        if #available(iOS 15.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            let windowScence = scenes.first as? UIWindowScene
            let window = windowScence?.windows.first
            let statusBarManager = window?.windowScene?.statusBarManager
            
            let statusBarView = UIView(frame: statusBarManager?.statusBarFrame ?? .zero)
            statusBarView.backgroundColor = bgColor
            
            window?.addSubview(statusBarView)
        } else {
            let statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
            statusBarView?.backgroundColor = bgColor
        }
    }
}
