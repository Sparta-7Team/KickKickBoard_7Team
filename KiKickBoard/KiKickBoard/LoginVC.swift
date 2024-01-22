//
//  LoginVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit
import SnapKit
class LoginVC: UIViewController {
    
    let mainImage = UIImageView(image: UIImage(named: "KiKickBoard_Logo"))

    let uIDTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .alphabet
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.returnKeyType = .next
        return textField
    }()
    
    let uPWTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.returnKeyType = .done
        return textField
    }()
    
    var eyeButton = UIButton(type: .custom)
    
    let logInBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = UIColor(named: "PrimaryColor")
        return btn
    }()
    
    let signUPBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(UIColor(named: "PrimaryColor"), for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyBoardHide()
        self.view.backgroundColor = .white
        LoginController.shared.readCurrentUserInfo()
        addSubView()
        autoLayout()
        setupInteraction()
        setEyeButton()
    }
    
    private func addSubView() {
        self.view.addSubview(mainImage)
        self.view.addSubview(uIDTextField)
        self.view.addSubview(uPWTextField)
        self.view.addSubview(logInBtn)
        self.view.addSubview(signUPBtn)
        uIDTextField.text = LoginController.shared.currentUserInfo.uid
        uPWTextField.text = LoginController.shared.currentUserInfo.password

    }
//MARK: - 오토레이 아웃 Code
    private func autoLayout() {
        mainImage.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(80)
            make.right.equalToSuperview().offset(-80)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(mainImage.snp.width).multipliedBy(584.0 / 730.0)
        }
        
        uIDTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(60)
            make.top.equalTo(mainImage.snp.bottom).offset(50)
        }
        
        uPWTextField.snp.makeConstraints() { make in
            make.left.equalTo(uIDTextField)
            make.width.equalTo(uIDTextField)
            make.height.equalTo(uIDTextField)
            make.top.equalTo(uIDTextField.snp.bottom).offset(5)
        }
        
        logInBtn.snp.makeConstraints() { make in
            make.left.equalTo(uIDTextField)
            make.width.equalTo(uIDTextField)
            make.height.equalTo(65)
            make.top.equalTo(uPWTextField.snp.bottom).offset(10)
        }
        
        signUPBtn.snp.makeConstraints() { make in
            make.right.equalTo(logInBtn)
            make.width.equalTo(100)
            make.top.equalTo(logInBtn.snp.bottom).offset(20)
        }
    }
//MARK: - Button Action
    private func setupInteraction() {
        logInBtn.addTarget(self, action: #selector(touchSignIn), for: .touchUpInside)
        signUPBtn.addTarget(self, action: #selector(touchSignUP), for: .touchUpInside)
        
        uIDTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        uPWTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
    }

    @objc func touchSignIn() {
        guard let incomeID = self.uIDTextField.text else { return }
        guard let incomePW = self.uPWTextField.text else { return }
        
        let incomeUserInfo = LoginModel(uid: incomeID, password: incomePW)
        
        // incomeUserInfo의 아이디, 비밀번호 모두가 UserDefaults로 저장된 UserInfoArray에 저장되어 있는지 여부 판단
        if LoginController.shared.doesUserInfoExist(currentUserInfo: incomeUserInfo) {
            
            // 있다면, 메세지를 띄우고 이전화면으로.
            LoginController.shared.currentUserInfo = incomeUserInfo
            LoginController.shared.saveCurrentUserInfo()
            showAlert(message: "로그인 성공", handler: {_ in
                let mainRootVIewController = TabBarController()
                self.view.window?.rootViewController = mainRootVIewController
            })
        } else {
            
            showAlert(message: "잘못된 정보입니다.", handler: nil)
        }

        print("Saved UserInfo : \(LoginController.shared.currentUserInfo)")
    }
    private func showAlert(message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func touchSignUP() {
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
    @objc func didEndOnExit(_ sender: UITextField) {
            if uIDTextField.isFirstResponder {
                uPWTextField.becomeFirstResponder()
            }
            else if uPWTextField.isFirstResponder {
                touchSignIn()
            }
        }
                                    
    private func setEyeButton() {
        eyeButton = UIButton(type: .custom)
        
        let imageSize = CGSize(width: 20, height: 20)
        
        eyeButton.setImage(UIImage(named: "password-hide")?.resized(to: imageSize), for: .selected)
        eyeButton.setImage(UIImage(named: "password-view")?.resized(to: imageSize), for: .normal)
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        self.eyeButton.configuration = buttonConfiguration

        self.uPWTextField.rightView = eyeButton
        self.uPWTextField.rightViewMode = .always
        
        uPWTextField.isSecureTextEntry = true
        
        eyeButton.addAction(UIAction(handler: {[self] _ in
            uPWTextField.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }), for: .touchUpInside)
    }
}
