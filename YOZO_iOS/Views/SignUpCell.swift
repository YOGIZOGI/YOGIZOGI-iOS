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
    
    private let authViewModel = SignUpViewModel()
    
    var stepMarkers = [UIView]()
    let numberOfSteps = 4
    let markerDiameter: CGFloat = 7.0
    let progressBarHorizontalInset: CGFloat = 45.0
    let progressBarHeight: CGFloat = 2.0
    
    // 프로그래스 바 생성
    let progressBarBackgroundView = UIView().then {
           $0.backgroundColor =  UIColor(r: 219, g: 219, b: 219)
       }
       
       // 프로그레스 바 진행 상태 뷰
       let progressBarForegroundView = UIView().then {
           $0.backgroundColor =  UIColor(r: 255, g: 216, b: 0)
       }
    
    lazy var totalSpacing: CGFloat = {
        return CGFloat(numberOfSteps - 1) * markerDiameter
       }()

       lazy var progressBarWidth: CGFloat = {
           return view.frame.width - 40 - totalSpacing
       }()

    
    let InputPhoneNumLabel = UILabel().then {
        
        $0.text = "60초면 가입완료!\n본인인증을 위해\n전화번호를 입력해주세요."
        
        let range = ($0.text! as NSString).range(of: "전화번호를 입력")
        $0.numberOfLines = 3
        $0.font = UIFont(name: "NanumSquareNeo-Variable_Regular", size: 20)
        $0.setBoldFont("NanumSquareNeo-Variable_Bold", range: range)
        
    }
    
    let authIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "authIcon")
    }
    
    let authBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(r: 255, g: 216, b: 58)
        $0.setTitle("인증요청", for: .normal)
        $0.setTitleColor(UIColor(r: 0, g: 0, b: 0), for: .normal)
        $0.titleLabel?.font = UIFont(name: "NanumSquareNeo-Variable_ExtraBold", size: 16)
        $0.layer.cornerRadius = 5 // 테두리 둥글기 설정
        $0.addTarget(self, action: #selector(authBtnTapped), for: .touchUpInside)
        
    }
    
    private let underlineView = UIView().then {
        $0.backgroundColor = UIColor(r: 154, g: 132, b: 131)
    }
    
    private let authTextField = InsetTextField().then {
        $0.borderStyle = .none // 외곽선 없애기
        $0.keyboardType = .default // 키보드 타입 설정
        $0.returnKeyType = .done // 반환 키 유형
        $0.clearButtonMode = .whileEditing // 편집 중 clear 버튼 보이기
        
        // Placeholder 설정
        $0.placeholder = "'-'제외 ex)01012345678"
        $0.font = UIFont(name: "NanumSquareNeo-Variable_Regular", size: 15)
        $0.insetX = 12
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authTextField.becomeFirstResponder()
        //getFontName()
        setUp()
        
    }
    
    func setUp() {
        
        view.backgroundColor = .white
        
        view.addSubview(InputPhoneNumLabel)
        view.addSubview(authIcon)
        view.addSubview(underlineView)
        view.addSubview(authTextField)
        view.addSubview(authBtn)
        view.addSubview(progressBarBackgroundView)
        progressBarBackgroundView.addSubview(progressBarForegroundView)
        progressBarBackgroundView.layer.cornerRadius = progressBarHeight / 2
        progressBarForegroundView.layer.cornerRadius = progressBarHeight / 2
        
        
        progressBarBackgroundView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(131)
            $0.leading.equalTo(view.snp.leading).offset(progressBarHorizontalInset)
            $0.trailing.equalTo(InputPhoneNumLabel)
            $0.height.equalTo(progressBarHeight)
        }
        
        progressBarForegroundView.snp.makeConstraints {
            $0.leading.equalTo(progressBarBackgroundView.snp.leading)
            $0.top.equalTo(progressBarBackgroundView.snp.top)
            $0.bottom.equalTo(progressBarBackgroundView.snp.bottom)
            $0.width.equalTo(0)
        }
        
        
        InputPhoneNumLabel.snp.makeConstraints {
            $0.top.equalTo(progressBarBackgroundView.snp.bottom).offset(20)
            $0.leading.equalTo(progressBarBackgroundView)
            $0.width.equalTo(220)
            $0.height.equalTo(90)
        }
        
        authIcon.snp.makeConstraints {
            $0.top.equalTo(InputPhoneNumLabel)
            $0.leading.equalTo(InputPhoneNumLabel.snp.trailing).offset(1)
            $0.width.equalTo(89)
            $0.height.equalTo(89)
        }
        
        authTextField.snp.makeConstraints {
            $0.top.equalTo(InputPhoneNumLabel.snp.bottom).offset(45)
            $0.leading.equalTo(InputPhoneNumLabel)
            $0.trailing.equalTo(authIcon)
            $0.height.equalTo(40)
        }
        
        underlineView.snp.makeConstraints {
            $0.top.equalTo(authTextField.snp.bottom).offset(1)
            $0.leading.trailing.equalTo(authTextField)
            $0.height.equalTo(1.5)
        }
        
        authBtn.snp.makeConstraints {
            $0.top.equalTo(authTextField.snp.bottom).offset(72)
            $0.leading.trailing.equalTo(0)
            $0.height.equalTo(65)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpStepMarkers()
    }
    
    func setUpStepMarkers() {
        stepMarkers.forEach { $0.removeFromSuperview() }
        stepMarkers.removeAll()
        
        let progressBarTotalWidth = progressBarBackgroundView.frame.width
           let spacing = progressBarTotalWidth / CGFloat(numberOfSteps - 1)
        
           for i in 0..<numberOfSteps {
              // let stepMarker = GradientView()
               let stepMarker = UIView()
               
               stepMarker.backgroundColor = UIColor(r: 219, g: 219, b: 219)
               view.addSubview(stepMarker)
               stepMarkers.append(stepMarker)
               
               stepMarker.layer.cornerRadius = markerDiameter / 2
               stepMarker.clipsToBounds = true

               stepMarker.snp.makeConstraints { make in
                   make.centerX.equalTo(progressBarBackgroundView.snp.leading).offset(spacing * CGFloat(i))
                   make.centerY.equalTo(progressBarBackgroundView.snp.centerY)
                   make.width.height.equalTo(markerDiameter)
               }
           }

           // 첫 번째 마커는 항상 노란색
           stepMarkers.first?.backgroundColor = UIColor(r: 255, g: 216, b: 58)
        
    }

    
    func updateProgressBar(to stepIndex: Int) {
        let stepWidth = progressBarBackgroundView.frame.width / CGFloat(numberOfSteps - 1) * CGFloat(stepIndex)
           progressBarForegroundView.snp.updateConstraints {
               $0.width.equalTo(stepWidth)
           }
        
        // 모든 마커를 회색으로 설정
        stepMarkers.forEach { $0.backgroundColor = UIColor(r: 219, g: 219, b: 219) }
        // 현재 단계까지의 마커를 노란색으로 설정
        for i in 0...stepIndex {
            stepMarkers[i].backgroundColor = UIColor(r: 255, g: 216, b: 0)
        }
        
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }

    
    @objc func authBtnTapped() {

        updateProgressBar(to: 1)
        
        
        guard let phoneNum = authTextField.text, !phoneNum.isEmpty else {
            
            // 전화번호 입력란이 비어 있으면 사용자에게 알림
            let alert = UIAlertController(title: "경고", message: "전화번호를 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
            
            return
        }
        
        authViewModel.authenticatePhoneNum(phoneNum) { authResponse in
            DispatchQueue.main.async {
                if let auth = authResponse {
                    // `Auth` 모델에서 `status` 필드를 확인하여 결과에 따라 분기 처리
                    switch auth.status {
                    case "SUCCESS":
                        // 회원가입 가능 상태 처리
                        print("회원가입 가능")
                    case "FAILURE":
                        // 이미 존재하는 전화번호 상태 처리
                        print("이미 있는 전화번호")
                    default:
                        // 예상치 못한 상태 처리
                        print("알 수 없는 오류가 발생했습니다")
                    }
                } else {
                    // 서버로부터 응답이 없거나 처리할 수 없는 응답일 경우
                    print("인증 실패: 서버로부터 응답을 받을 수 없습니다")
                }
            }
        }
    }
   
  
    
    
    //MARK: - 폰트 이름 확인
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
