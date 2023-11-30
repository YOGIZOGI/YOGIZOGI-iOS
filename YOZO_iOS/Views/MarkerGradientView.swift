//
//  MarkerGradientView.swift
//  YOZO_iOS
//
//  Created by 홍서린 on 2023/11/30.
//

import Foundation
import UIKit

class GradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpGradientLayer()
    }
    
    private func setUpGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.yellow.cgColor,
            UIColor(red: 1, green: 216/255, blue: 58/255, alpha: 0.46).cgColor
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        // 그라데이션 레이어의 크기를 마커의 2배로 설정
        gradientLayer.frame = CGRect(x: -self.bounds.width * 0.5, y: -self.bounds.height * 0.5,
                                     width: self.bounds.width * 2, height: self.bounds.height * 2)
        gradientLayer.cornerRadius = self.bounds.width
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = self.layer.sublayers?.compactMap({ $0 as? CAGradientLayer }).first {
            gradientLayer.frame = CGRect(x: -self.bounds.width * 0.5, y: -self.bounds.height * 0.5,
                                         width: self.bounds.width * 2, height: self.bounds.height * 2)
            gradientLayer.cornerRadius = self.bounds.width
        }
    }
    
    
}
