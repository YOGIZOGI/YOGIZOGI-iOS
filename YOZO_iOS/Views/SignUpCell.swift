//
//  SignUpCell.swift
//  YOZO_iOS
//
//  Created by 홍서린 on 2023/10/13.
//

import Foundation
import UIKit
import SnapKit
import Then

class SignUpCell: UIViewController {
    
    let InputPhoneNumLabel = UILabel().then {
        
        $0.text = "60초면 가입완료!\n본인인증을 위해\n전화번호를 입력해주세요"
        
        let range = ($0.text! as NSString).range(of: "본인인증")
        $0.numberOfLines = 3
        $0.font = UIFont(name: "NanumSquareNeo-Variable_Regular", size: 20)
        $0.setBoldFont("NanumSquareNeo-Variable_Bold", range: range)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(InputPhoneNumLabel)
    
        getFontName()

        InputPhoneNumLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(50)
            make.height.width.equalTo(400)
        }
        
        func getFontName() {
            for family in UIFont.familyNames {
                
                let sName: String = family as String
                print("family: \(sName)")
                
                for name in UIFont.fontNames(forFamilyName: sName) {
                    print("name: \(name as String)")
                }
            }
        }
    
    }

}
