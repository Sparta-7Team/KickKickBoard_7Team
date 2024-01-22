//
//  NaverMapAddressModel.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/16.
//

import Foundation
struct NMapAddModel : Decodable {
    let status: String
    let addresses: [Address]
    let errorMessage: String
}
struct Address: Decodable {
    let roadAddress, jibunAddress, englishAddress: String
    let x, y: String
    let distance: Double
}
