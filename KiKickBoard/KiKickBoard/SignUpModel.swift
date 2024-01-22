//
//  SignUpModel.swift
//  KiKickBoard
//
//  Created by t2023-m0026 on 1/16/24.
//

import Foundation

struct UserInfo : Codable {
    let uid : String
    let password : String
    let email : String
    let name : String
    let phoneNumber : String
}
