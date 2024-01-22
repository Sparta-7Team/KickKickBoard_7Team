//
//  LoginController.swift
//  KiKickBoard
//
//  Created by t2023-m0026 on 1/16/24.
//

import Foundation

class LoginController {
    static let shared = LoginController()
    private init() {}
    
    var currentUserInfo : LoginModel = LoginModel(uid: "", password: "")
        
    let encoder: JSONEncoder = JSONEncoder()
    let decoder: JSONDecoder = JSONDecoder()
    
    func saveCurrentUserInfo() {
        if let encodedData = try? encoder.encode(currentUserInfo){
            UserDefaults.standard.set(encodedData, forKey: "currentUserInfo")
        }
    }
    
    func readCurrentUserInfo() {
        if let savedData = UserDefaults.standard.object(forKey: "currentUserInfo") as? Data, let decodedData = try? decoder.decode(LoginModel.self, from: savedData) {
            currentUserInfo = decodedData
        }
    }
    
    func doesUserInfoExist(currentUserInfo: LoginModel) -> Bool {
        // 저장된 데이터 읽어오기
        SignUpController.shared.readUserInfoArray()
        
        // id, password, email 중에서 중복된 것이 있는지 확인
        return SignUpController.shared.userInfoArray.contains { existingUserInfo in
            return existingUserInfo.uid == currentUserInfo.uid &&
                   existingUserInfo.password == currentUserInfo.password
        }
    }
}
