//
//  SignUpVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit

class SignUpVC: UIViewController {
    
    var idCheck = false
    var pwCheck = false
    var eMailCheck = false
    var mobileCheck = false
    
    let idStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 17)
        str.textColor = .black
        str.text = "아이디"
        str.textAlignment = .left
        return str
    }()
    
    let idSignUpTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "소문자, 숫자 5~14자"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .alphabet
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.returnKeyType = .next
        return textField
    }()
    
    let idDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
    }()
    
    let pwStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 17)
        str.textColor = .black
        str.text = "비밀번호"
        str.textAlignment = .left
        return str
    }()
    
    let pwSignUpTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "대소문자, 숫자, 특수문자 1개 이상 필수 8~16자"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.returnKeyType = .next
        return textField
    }()
    
    var eyeButton = UIButton(type: .custom)
    
    let pwDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
    }()
    
    let pwCheckStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 17)
        str.textColor = .black
        str.text = "비밀번호 확인"
        str.textAlignment = .left
        return str
    }()
    
    let pwSignUpCheckTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 다시 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.returnKeyType = .next
        return textField
    }()
    
    let pwCheckDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
    }()
    
    let eMailStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 17)
        str.textColor = .black
        str.text = "이메일"
        str.textAlignment = .left
        return str
    }()
    
    let eMailSignUpTextField : CustomTextFieldEMail = {
        let textField = CustomTextFieldEMail()
        textField.placeholder = "KiKick@Board.com"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.returnKeyType = .next
        return textField
    }()
    
    let eMailCheckDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
    }()
    
    let nameStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 17)
        str.textColor = .black
        str.text = "이름"
        str.textAlignment = .left
        return str
    }()
    
    let nameSignUpTextField : CustomTextFieldName = {
        let textField = CustomTextFieldName()
        textField.placeholder = "박보검"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.returnKeyType = .next
        return textField
    }()
    
    let mobileStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 17)
        str.textColor = .black
        str.text = "전화번호"
        str.textAlignment = .left
        return str
    }()
    
    let mobileSignUpTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "-없이 입력"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.returnKeyType = .done
        return textField
    }()
    
    let joinBtn : UIButton = {
        let btn = UIButton()
        btn.isEnabled = false
        btn.backgroundColor = .lightGray
        btn.setTitle("JOIN", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        keyBoardHide()
        addSubView()
        autoLayout()
        setupInteraction()
        setEyeButton()
        mobileSignUpTextField.delegate = self
        setUpKeyboard()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeStatusBarBgColor(bgColor: .white)
        navigationBarAppearance()
    }
}


// MARK: extention of SignUpVC - addSubView, autoLayout, interaction etc.
extension SignUpVC {
    private func addSubView() {
        self.view.addSubViews([idStr, idSignUpTextField, idDescription,pwStr, pwSignUpTextField, pwDescription,pwCheckStr, pwSignUpCheckTextField,pwCheckDescription,eMailStr, eMailSignUpTextField, eMailCheckDescription,nameStr, nameSignUpTextField, mobileStr, mobileSignUpTextField, joinBtn])
    }
    
    private func autoLayout() {
        idStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(120)
        }
        idSignUpTextField.snp.makeConstraints() { make in
            make.left.equalTo(idStr)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(idStr.snp.bottom).offset(5)
            make.height.equalTo(45)
        }
        idDescription.snp.makeConstraints() { make in
            make.left.equalTo(idStr).offset(5)
            make.top.equalTo(idSignUpTextField.snp.bottom).offset(5)
        }
        pwStr.snp.makeConstraints() { make in
            make.left.equalTo(idStr)
            make.top.equalTo(idSignUpTextField.snp.bottom).offset(25)
        }
        pwSignUpTextField.snp.makeConstraints() { make in
            make.left.equalTo(idSignUpTextField)
            make.right.equalTo(idSignUpTextField)
            make.top.equalTo(pwStr.snp.bottom).offset(5)
            make.height.equalTo(idSignUpTextField)
        }
        pwDescription.snp.makeConstraints() { make in
            make.left.equalTo(idDescription)
            make.top.equalTo(pwSignUpTextField.snp.bottom).offset(5)
        }
        pwCheckStr.snp.makeConstraints() { make in
            make.left.equalTo(idStr)
            make.top.equalTo(pwSignUpTextField.snp.bottom).offset(25)
        }
        pwSignUpCheckTextField.snp.makeConstraints() { make in
            make.left.equalTo(idSignUpTextField)
            make.right.equalTo(idSignUpTextField)
            make.top.equalTo(pwCheckStr.snp.bottom).offset(5)
            make.height.equalTo(idSignUpTextField)
        }
        pwCheckDescription.snp.makeConstraints() { make in
            make.left.equalTo(idDescription)
            make.top.equalTo(pwSignUpCheckTextField.snp.bottom).offset(5)
        }
        eMailStr.snp.makeConstraints() { make in
            make.left.equalTo(idStr)
            make.top.equalTo(pwSignUpCheckTextField.snp.bottom).offset(25)
        }
        eMailSignUpTextField.snp.makeConstraints() { make in
            make.left.equalTo(idSignUpTextField)
            make.right.equalTo(idSignUpTextField)
            make.top.equalTo(eMailStr.snp.bottom).offset(5)
            make.height.equalTo(idSignUpTextField)
        }
        eMailCheckDescription.snp.makeConstraints() { make in
            make.left.equalTo(idDescription)
            make.top.equalTo(eMailSignUpTextField.snp.bottom).offset(5)
        }
        nameStr.snp.makeConstraints() { make in
            make.left.equalTo(idStr)
            make.top.equalTo(eMailSignUpTextField.snp.bottom).offset(25)
        }
        nameSignUpTextField.snp.makeConstraints() { make in
            make.left.equalTo(idSignUpTextField)
            make.right.equalTo(idSignUpTextField)
            make.top.equalTo(nameStr.snp.bottom).offset(5)
            make.height.equalTo(idSignUpTextField)
        }
        mobileStr.snp.makeConstraints() { make in
            make.left.equalTo(idStr)
            make.top.equalTo(nameSignUpTextField.snp.bottom).offset(25)
        }
        mobileSignUpTextField.snp.makeConstraints() { make in
            make.left.equalTo(idSignUpTextField)
            make.right.equalTo(idSignUpTextField)
            make.top.equalTo(mobileStr.snp.bottom).offset(5)
            make.height.equalTo(idSignUpTextField)
        }
        joinBtn.snp.makeConstraints() { make in
            make.left.equalTo(idSignUpTextField)
            make.right.equalTo(idSignUpTextField)
            make.top.equalTo(mobileSignUpTextField.snp.bottom).offset(5)
            make.height.equalTo(65)
        }
    }
    
    private func setupInteraction() {
        joinBtn.addTarget(self, action: #selector(touchJoin), for: .touchUpInside)
        
        idSignUpTextField.addTarget(self, action: #selector(idValidCheck), for: .editingChanged)
        pwSignUpTextField.addTarget(self, action: #selector(pwValidCheck), for: .editingChanged)
        pwSignUpCheckTextField.addTarget(self, action: #selector(pwEqualCheck), for: .editingChanged)
        eMailSignUpTextField.addTarget(self, action: #selector(eMailValidCheck), for: .editingChanged)
        nameSignUpTextField.addTarget(self, action: #selector(checkAllConditions), for: .editingChanged)
        
        idSignUpTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        pwSignUpTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        pwSignUpCheckTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        eMailSignUpTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        nameSignUpTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
    }
    
    // 사용자 입력 중 아이디, 이메일, 전화번호를 저장된 정보와 확인한 후, 없다면 UserDefaults에 저장.
    @objc func touchJoin() {
        guard let newID = self.idSignUpTextField.text else { return }
        guard let newPW = self.pwSignUpTextField.text else { return }
        guard let newEMail = self.eMailSignUpTextField.text else { return }
        guard let newName = self.nameSignUpTextField.text else { return }
        guard let newMobile = self.mobileSignUpTextField.text else { return }
        
        let newUserInfo = UserInfo(uid: newID, password: newPW, email: newEMail, name: newName, phoneNumber: newMobile)
        
        // newUserInfo의 아이디, 이메일, 전화번호 중 같은 정보가 UserDefaults내 저장된 여부 판단
        if SignUpController.shared.doesUserInfoExist(userInfo: newUserInfo) {
            
            // 있다면, 메세지를 띄우고 이전화면으로.
            showAlert(message: "이미 가입된 정보가 있습니다.", handler: nil)
        } else {
            // 없다면, 입력된 정보 UserDefaults에 저장. alert로 메세지를 띄워주고, 확인을 누르면 HomeVC로 이동.
            SignUpController.shared.userInfoArray.append(newUserInfo)
            SignUpController.shared.saveUserInfoArray()
            SignUpController.shared.readUserInfoArray()
            showAlert(message: "KiKickBoard 가입을 환영합니다!", handler: {_ in
                self.navigationController?.popToRootViewController(animated: true)})
        }

        print("Saved UserInfo : \(SignUpController.shared.userInfoArray)")
    }
    
    @objc func idValidCheck() {
        idDescription.isHidden = false
        
        let minCount = 5
        let maxCount = 14
        let count = idSignUpTextField.text!.count
        
        switch count {
        case 0 :
            idDescription.text = "아이디는 필수입력 정보입니다."
            self.idCheck = false
            self.oKCheck()
            print("id False")
        case 1..<minCount :
            idDescription.text = "아이디는 \(minCount)글자 이상이어야 합니다."
            self.idCheck = false
            self.oKCheck()
            print("id False")
        case minCount..<maxCount :
            let idPattern = "^[a-z0-9]{\(minCount),\(maxCount)}$"
            let isValidPattern = (idSignUpTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
            if isValidPattern {
                idDescription.text = "조건에 맞는 아이디"
                idDescription.isHidden = true
                self.idCheck = true
                self.oKCheck()
                print("id True")
            } else {
                idDescription.text = "알파벳 소문자, 숫자만 사용할 수 있습니다."
                self.idCheck = false
                self.oKCheck()
                print("id False")
            }
        default :
            idDescription.text = "아이디는 \(maxCount)글자 이하여야 합니다."
            self.idCheck = false
            self.oKCheck()
            print("id False")
        }
        
    }
    @objc func pwValidCheck() {
        pwDescription.isHidden = false
        
        let minCount = 8
        let maxCount = 16
        let count = pwSignUpTextField.text!.count
        
        switch count {
        case 0 :
            pwDescription.text = "비밀번호는 필수입력 정보입니다."
            self.oKCheck()
        case 1..<minCount :
            pwDescription.text = "비밀번호는 \(minCount)글자 이상이어야 합니다."
            self.oKCheck()
        case minCount..<maxCount :
            //(?=.*[]) 조건문 []안에 조건 삽입. 소문자, 대문자, 숫자, 특수문자 각각 1개 이상
            let pwPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[`~!@#$%^&*?])[a-zA-Z0-9`~!@#$%^&*?]{\(minCount),\(maxCount)}$"
            let isValidPattern = (pwSignUpTextField.text!.range(of: pwPattern, options: .regularExpression) != nil)
            if isValidPattern {
                pwDescription.text = "조건에 맞는 비밀번호"
                self.oKCheck()
                pwDescription.isHidden = true
            } else {
                pwDescription.text = "알파벳 대소문자, 숫자를 각각 1개 이상 사용해야 합니다."
                self.oKCheck()
            }
        default :
            pwDescription.text = "비밀번호는 \(maxCount)글자 이하여야 합니다."
            self.oKCheck()
        }
        
    }
    @objc func pwEqualCheck() {
        pwCheckDescription.isHidden = false
        
        switch pwSignUpCheckTextField.text {
        case pwSignUpTextField.text :
            pwCheckDescription.text = "비밀번호가 일치합니다."
            pwCheckDescription.textColor = .blue
            self.pwCheck = true
            self.oKCheck()
            print("pw True")
        default :
            pwCheckDescription.text = "비밀번호가 일치하지 않습니다."
            pwCheckDescription.textColor = .red
            self.pwCheck = false
            self.oKCheck()
            print("pw False")
        }
        
    }
    @objc func eMailValidCheck() {
        eMailCheckDescription.isHidden = false
        
        let minCount = 1
        let maxCount = 255
        let count = eMailSignUpTextField.text!.count
        
        switch count {
        case 0 :
            eMailCheckDescription.text = "이메일 주소는 필수입력 정보입니다."
            self.eMailCheck = false
            self.oKCheck()
            print("eMail False")
        case minCount..<maxCount :
            let eMailPattern = "^[a-zA-Z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
            let isValidPattern = (eMailSignUpTextField.text!.range(of: eMailPattern, options: .regularExpression) != nil)
            if isValidPattern {
                eMailCheckDescription.text = ""
                self.eMailCheck = true
                self.oKCheck()
                print("eMail True")
            } else {
                eMailCheckDescription.text = "정상적인 이메일 주소가 아닙니다."
                self.eMailCheck = false
                self.oKCheck()
                print("eMail False")
            }
        default :
            eMailCheckDescription.text = "정상적인 이메일 주소가 아닙니다."
            self.eMailCheck = false
            self.oKCheck()
            print("eMail False")
        }
        
    }
    
    // 다음 누르면 입력창 넘어가기, 완료 누르면 키보드 내려가기
    @objc func didEndOnExit(_ sender: UITextField) {
        if idSignUpTextField.isFirstResponder {
            pwSignUpTextField.becomeFirstResponder()
        }
        else if pwSignUpTextField.isFirstResponder {
            pwSignUpCheckTextField.becomeFirstResponder()
        }
        else if pwSignUpCheckTextField.isFirstResponder {
            eMailSignUpTextField.becomeFirstResponder()
        }
        else if eMailSignUpTextField.isFirstResponder {
            nameSignUpTextField.becomeFirstResponder()
        }
        else if nameSignUpTextField.isFirstResponder {
            mobileSignUpTextField.becomeFirstResponder()
        }
    }
    
    @objc func checkAllConditions() {
        self.oKCheck()
    }
    
    func oKCheck() {
        if idCheck && pwCheck && eMailCheck && mobileCheck && !nameSignUpTextField.text!.isEmpty {
            joinBtn.isEnabled = true
            joinBtn.backgroundColor = UIColor(named: "PrimaryColor")
        } else {
            joinBtn.isEnabled = false
            joinBtn.backgroundColor = .lightGray
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

        self.pwSignUpTextField.rightView = eyeButton
        self.pwSignUpTextField.rightViewMode = .always
        
        pwSignUpTextField.isSecureTextEntry = true
        
        eyeButton.addAction(UIAction(handler: {[self] _ in
            pwSignUpTextField.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }), for: .touchUpInside)
    }
    
    private func navigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        
        navigationController?.navigationBar.tintColor = UIColor(hexCode: "176963")
        navigationController?.navigationBar.backgroundColor = UIColor.systemBackground
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        UINavigationBar.appearance().standardAppearance = appearance
    }
}

