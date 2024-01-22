//
//  CLLocationCoordinate2D+Extension.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/17.
//

import Foundation
import CoreLocation
extension CLLocationCoordinate2D{
    func distance(from: CLLocationCoordinate2D) -> CLLocationDistance { // 두점 좌표 사이의 거리를 m로 치환
           let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
           let to = CLLocation(latitude: self.latitude, longitude: self.longitude)
           return from.distance(from: to)
       }
}
