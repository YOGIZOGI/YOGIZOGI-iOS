//
//  SignUpViewModel.swift
//  YOZO_iOS
//
//  Created by 홍서린 on 2023/11/29.
//

import Foundation

class SignUpViewModel {
    
    public var urlString = "https://dev.yogizogi.store/api/"
    
    // 서버로 전화번호 인증을 요청하는 함수 정의
    func authenticatePhoneNum(_ phoneNum: String, completion: @escaping (Auth?) -> Void) {
        let urlString = urlString + "verification/check"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        // Query 파라미터를 URL에 추가
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "phone_number", value: phoneNum)]

        guard let queryUrl = components?.url else {
            completion(nil)
            return
        }

        // GET 요청 실행
        URLSession.shared.dataTask(with: queryUrl) { (data, response, error) in
            // 오류 처리
            guard error == nil else {
                completion(nil)
                return
            }
            
            // 데이터 처리
            if let data = data {
                do {
                    // JSON 디코딩
                    let authResponse = try JSONDecoder().decode(Auth.self, from: data)
                    completion(authResponse)
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    
}
