//
//  SignUpController.swift
//  KiKickBoard
//
//  Created by t2023-m0026 on 1/16/24.
//

import Foundation

class SignUpController {
    static let shared = SignUpController()
    private init() {}
    
    var savedUserInfo : UserInfo = UserInfo(
        uid: "", password: "", email: "", name: "", phoneNumber: ""
    )
    
    var userInfoArray : [UserInfo] = []
    
    let encoder: JSONEncoder = JSONEncoder()
    let decoder: JSONDecoder = JSONDecoder()
    
    func saveUserInfoArray() {
        if let encodedData = try? encoder.encode(userInfoArray){
            UserDefaults.standard.set(encodedData, forKey: "userInfoArray")
        }
    }
    
    func readUserInfoArray() {
        if let savedData = UserDefaults.standard.object(forKey: "userInfoArray") as? Data, let decodedData = try? decoder.decode([UserInfo].self, from: savedData) {
            userInfoArray = decodedData
            print("\(userInfoArray)")
        }
    }
    
    func doesUserInfoExist(userInfo: UserInfo) -> Bool {
        // 저장된 데이터 읽어오기
        readUserInfoArray()
        
        // id, password, email 중에서 중복된 것이 있는지 확인
        return userInfoArray.contains { existingUserInfo in
            return existingUserInfo.uid == userInfo.uid ||
                   existingUserInfo.email == userInfo.email ||
                   existingUserInfo.phoneNumber == userInfo.phoneNumber
        }
    }
}
