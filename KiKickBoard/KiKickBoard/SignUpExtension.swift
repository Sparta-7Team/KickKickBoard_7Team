//
//  SignUpExtension.swift
//  KiKickBoard
//
//  Created by t2023-m0026 on 1/17/24.
//

import UIKit



extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

extension SignUpVC : UITextFieldDelegate {
    func format(mask : String,phone : String) -> String{ // format함수
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(mask:"XXX-XXXX-XXXX", phone: newString)
        
        // Check if the phone number is complete
        let phoneNumber = textField.text!.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        let isComplete = phoneNumber.count == 11

        // Update mobileCheck accordingly
        mobileCheck = isComplete
        self.oKCheck()

        return false
    }
}

// MARK: - 문자열에 구분자 삽입
extension String {
    public func inserting(separator: String, every n: Int) -> String {
        var result: [String] = []
        var currentIndex = startIndex

        while currentIndex < endIndex {
            let endIndex = index(currentIndex, offsetBy: n, limitedBy: endIndex) ?? self.endIndex
            result.append(String(self[currentIndex..<endIndex]))
            currentIndex = endIndex
        }

        return result.joined(separator: separator)
    }
}

// MARK: - 휴대폰 번호 검증
extension String {
    public func validatePhone(number: String) -> Bool {
        let regex = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: number)
    }
}

// MARK: - 휴대폰 번호 하이픈 추가
extension String {
    public var withHypen: String {
        var stringWithHypen: String = self
        stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.startIndex, offsetBy: 3))
        stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.endIndex, offsetBy: -4))
        return stringWithHypen
    }
}

extension SignUpVC {
    func showAlert(message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
}

extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
