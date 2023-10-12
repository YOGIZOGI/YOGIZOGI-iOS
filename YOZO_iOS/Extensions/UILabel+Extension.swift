//
//  UILabel+Extension.swift
//  YOZO_iOS
//
//  Created by 홍서린 on 2023/10/13.
//

import Foundation
import UIKit

extension UILabel {
    /* 텍스트 구간 색상 변경 */
    func setTextColor(_ color: UIColor, range: NSRange) {
        guard let attributedString = self.mutableAttributedString() else { return }
        
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.attributedText = attributedString
    }
    
    /* 텍스트 구간 볼드 폰트 변경 */
    func setBoldFont(_ boldFontName: String, range: NSRange) {
        guard let font = self.font,
              let boldFont = UIFont(name: boldFontName, size: font.pointSize) else {
            return
        }
        
        return setFont(boldFont, range: range)
    }
    
    /* 텍스트 구간 폰트 변경 */
    func setFont(_ font: UIFont, range: NSRange) {
        guard let attributedString = self.mutableAttributedString() else { return }
        
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        self.attributedText = attributedString
    }
    
    /* 밑줄 추가 */
    func setUnderline(range: NSRange) {
        guard let attributedString = self.mutableAttributedString() else { return }
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        self.attributedText = attributedString
    }
    
    /* AttributedString이 설정되어있지 않으면 생성하여 반환한다. */
    private func mutableAttributedString() -> NSMutableAttributedString? {
        guard let labelText = self.text, let labelFont = self.font else { return nil }
        
        var attributedString: NSMutableAttributedString?
        if let attributedText = self.attributedText {
            attributedString = attributedText.mutableCopy() as? NSMutableAttributedString
        } else {
            attributedString = NSMutableAttributedString(string: labelText,
                                                         attributes: [NSAttributedString.Key.font :labelFont])
        }
        
        return attributedString
    }
}
