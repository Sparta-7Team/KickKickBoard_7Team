//
//  UseHistoryModel.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/18.
//

import Foundation
struct UseHistoryModel{
    var serialNumber: Int
    var price : Int
    var date : String
    var distance  : Int
}
class UseHistoryData { // 이용 기록 관련
    static let shared = UseHistoryData()
    var historyList: [UseHistoryModel] = []
    private init() {}
}

class UseStatusData{ // 킥보드 사용중/미사용중 관련
    static let shared = UseStatusData()
    var status : Bool = false
    private init() {}
}
