//
//  KeyboardControll.swift
//  KiKickBoard
//
//  Created by t2023-m0026 on 1/18/24.
//

import UIKit
// setUpKeyboard 키보드가 특정 textField를 가릴 때, view를 높여주는 함수
extension SignUpVC {
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.setUpKeyboard()
//        print("viewWillAppear")
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        self.removeKeyboardNotifications()
//        print("viewWillDisappear")
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        print("touchesBegan")
    }
    
    func setUpKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        // keyboardFrame : 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
        // currentTextField : 현재 응답을 받고 있는 UITextField를 확인한다.
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue, let currentTextField = UIResponder.currentResponder as? UITextField else { return }
        
        // keyboardYTop : 키보드 상단의 y값(=높이)
        let keyboardYTop = keyboardFrame.cgRectValue.origin.y
//        let properYHight = keyboardYTop*1.3
        // convertedTextFieldFrame : 현재 선택한 textField의 frame값(=CGRect). superview에서 frame으로 convert를 했다는데.. 무슨 말인지..
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        // textFieldYBottom : 텍스트필드 하단의 y값 = 텍스트필드의 y값(=y축 위치) + 텍스트필드의 높이
        let textFieldYBottom = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        //
        if textFieldYBottom > keyboardYTop {
            let textFieldYTop = convertedTextFieldFrame.origin.y
            let properTextFieldHight = textFieldYTop - keyboardYTop/1.3
            view.frame.origin.y = -properTextFieldHight
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

// 현재 응답받고 있는 UI를 알아내기 위해 사용하는 extension -> 선택한 textfield가 어떤 textField인지
// 요건 완벽히 이해하지는 못했음..
extension UIResponder {
    
    private struct Static {
        static weak var responder : UIResponder?
    }
    
    static var currentResponder : UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func _trap() {
        Static.responder = self
    }
}

class CustomTextFieldName : UITextField {
    private func getKeyboardLanguages() -> String? {
        return "ko-KR"
    }
    
    override var textInputMode : UITextInputMode? {
        if let language = getKeyboardLanguages() {
            for inputMode in UITextInputMode.activeInputModes {
                if inputMode.primaryLanguage! == language {
                    return inputMode
                }
            }
        }
        return super.textInputMode
    }
}

class CustomTextFieldEMail : UITextField {
    private func getKeyboardLanguages() -> String? {
        return "en-EU"
    }
    
    override var textInputMode : UITextInputMode? {
        if let language = getKeyboardLanguages() {
            for inputMode in UITextInputMode.activeInputModes {
                if inputMode.primaryLanguage! == language {
                    return inputMode
                }
            }
        }
        return super.textInputMode
    }
}
