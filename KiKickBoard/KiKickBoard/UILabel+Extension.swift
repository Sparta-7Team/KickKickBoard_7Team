//
//  UILabel+Extension.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/17.
//

import Foundation
import UIKit
extension UILabel{
    func setRangeFontColor(fullText: String,range: String,color : UIColor,fontSzie: CGFloat, attributeString: inout NSMutableAttributedString){
        // label의 특정 범위의 글자 색상및 폰트 크기 변경 함수
        let range = (fullText as NSString).range(of: range)
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.gray,
            .font : UIFont.systemFont(ofSize: 15)
        ]
        attributeString.addAttributes(attributes, range: range)
        self.attributedText = attributeString
    }
    func setLineSpacing(attributeString: inout NSMutableAttributedString,spacing : CGFloat){ // UILabel 글자 간격 설정 함수
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttributes([.paragraphStyle : style], range: NSRange(location: 0, length: attributeString.length))
        self.attributedText = attributeString
    }
}
