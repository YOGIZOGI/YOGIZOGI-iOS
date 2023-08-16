//
//  LogInViewController.swift
//  YOZO_iOS
//
//  Created by J on 1/18/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LogInViewController: UIViewController {
    
    let loginview = LogInView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //view.layer.backgroundColor = UIColor(red: 0.329, green: 0.289, blue: 0.289, alpha: 1).cgColor
        //loginview.backgroundColor = .white
        
        view.addSubview(loginview)
        
        loginview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(288)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
    }


}
