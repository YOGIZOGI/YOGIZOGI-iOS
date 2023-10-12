//
//  SignUpModel.swift
//  YOZO_iOS
//
//  Created by 홍서린 on 2023/10/13.
//

import Foundation

struct User: Decodable{
    let name: String
    let pw: String
    let nickName: String
    let phoneNum: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "accountName"
        case pw = "password"
        case nickName
        case phoneNum = "phoneNumber"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        pw = try container.decode(String.self, forKey: .pw)
        nickName = try container.decode(String.self, forKey: .name)
        phoneNum = try container.decode(String.self, forKey: .pw)
    }
}
