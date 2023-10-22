//
//  SignUpCell.swift
//  YOZO_iOS
//
//  Created by 홍서린 on 2023/10/13.
//

import Foundation
import UIKit
import SnapKit

class SignUpCell: UIViewController {
    
    let InputPhoneNumLabel: UILabel = {
        let label = UILabel()
        label.text = "60초면 가입완료!\n본인인증을 위해\n전화번호를 입력해주세요"
        
        let range = (label.text! as NSString).range(of: "본인인증")
        label.numberOfLines = 2
        label.setBoldFont("JeonjuCraftMjOTFB", range: range)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(InputPhoneNumLabel)

        InputPhoneNumLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(50)
            make.height.width.equalTo(200)
        }
        
    }

}
