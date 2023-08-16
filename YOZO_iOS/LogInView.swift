//
//  LogInView.swift
//  YOZO_iOS
//
//  Created by J on 1/18/24.
//

import Foundation
import UIKit
import SnapKit

class LogInView: UIView {
    
    var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "로그인"
        loginLabel.font = UIFont.systemFont(ofSize:20)
        loginLabel.textColor = .black
        loginLabel.textAlignment = .center

        return loginLabel
    }()
    
    var telLabel: UILabel = {
        let telLabel = UILabel()
        telLabel.text = "전화번호"
        telLabel.font = UIFont.systemFont(ofSize:14)
        telLabel.textColor = .black
        telLabel.textAlignment = .center

        return telLabel
    }()
    
    var telTextField: UITextField = {
        let telTextField = UITextField()
        telTextField.attributedPlaceholder = NSAttributedString(string: "- 제외 전화번호 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        telTextField.clearsOnBeginEditing = false                 // 편집 시 기존 텍스트필드값 제거 false
        
        return telTextField
    }()
    
    var pwdLabel: UILabel = {
        let pwdLabel = UILabel()
        pwdLabel.text = "비밀번호"
        pwdLabel.font = UIFont.systemFont(ofSize:14)
        pwdLabel.textColor = .black
        pwdLabel.textAlignment = .center

        return pwdLabel
    }()
    
    var pwdTextFiled: UITextField = {
        let pwdTextFiled = UITextField()
        pwdTextFiled.placeholder = "비밀번호를 입력해주세요"
        pwdTextFiled.clearsOnBeginEditing = false                 // 편집 시 기존 텍스트필드값 제거 false
        
        return pwdTextFiled
    }()
    
    var findpwdLabel: UILabel = {
        let pwdLabel = UILabel()
        pwdLabel.text = "비밀번호를 잊어버리셨나요?"
        pwdLabel.font = UIFont.systemFont(ofSize:10)
        pwdLabel.textColor = UIColor(red: 0.454, green: 0.454, blue: 0.454, alpha: 1)
        pwdLabel.textAlignment = .center

        return pwdLabel
    }()
    
    var signupButton: UIButton = {
        let signupButton = UIButton()
        signupButton.setTitle("회원가입", for: .normal)
        signupButton.backgroundColor = UIColor(red: 0.329, green: 0.289, blue: 0.289, alpha: 1)

        return signupButton
    }()
    
    var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.backgroundColor = UIColor(red: 1, green: 0.849, blue: 0.229, alpha: 1)

        return loginButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
}

extension LogInView {
    private func setupUI() {
        self.layer.backgroundColor = UIColor.white.cgColor

        self.addSubview(loginLabel)
        self.addSubview(telLabel)
        self.addSubview(telTextField)
        self.addSubview(pwdLabel)
        self.addSubview(pwdTextFiled)
        self.addSubview(findpwdLabel)
        self.addSubview(signupButton)
        self.addSubview(loginButton)

        
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32.84)
            make.centerX.equalToSuperview()
        }
        
        telLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(124)
            make.leading.equalToSuperview().inset(43)
        }
        
        telTextField.snp.makeConstraints { make in
            make.top.equalTo(telLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(43)
        }
        
        pwdLabel.snp.makeConstraints { make in
            make.top.equalTo(telTextField.snp.bottom).offset(25)
            make.leading.equalToSuperview().inset(43)
        }
        
        pwdTextFiled.snp.makeConstraints { make in
            make.top.equalTo(pwdLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(43)
        }
        
        findpwdLabel.snp.makeConstraints { make in
            make.top.equalTo(pwdTextFiled.snp.bottom).offset(9)
            make.trailing.equalTo(pwdTextFiled.snp.trailing)
        }

        signupButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(416)
            make.leading.equalToSuperview().inset(37)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(416)
            make.trailing.equalToSuperview().inset(37)
        }
    }
}
