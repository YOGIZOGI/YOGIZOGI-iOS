//
//  AuthService.swift
//  YOZO_iOS
//
//  Created by 홍서린 on 1/8/24.
//

import Foundation
import RxSwift

class AuthService {
    func authenticate(user: User) -> Observable<Auth> {
        // URL과 URLRequest를 설정합니다.
        let url = URL(string: "https://your-api-url.com/authenticate")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // 사용자 데이터를 JSON으로 인코딩합니다.
        let userData = try? JSONEncoder().encode(user)
        request.httpBody = userData

        // URLSession을 사용하여 네트워크 요청을 수행하고 응답을 Auth 객체로 변환합니다.
        return URLSession.shared.rx.response(request: request)
            .flatMap { response, data -> Observable<Auth> in
                // HTTP 상태 코드를 확인합니다.
                guard 200..<300 ~= response.statusCode else {
                    // 오류를 처리합니다.
                    throw NSError(domain: "HTTP Request Failed", code: response.statusCode, userInfo: nil)
                }
                // 데이터를 Auth 객체로 디코드합니다.
                let auth = try JSONDecoder().decode(Auth.self, from: data)
                return Observable.just(auth)
            }
    }
}

