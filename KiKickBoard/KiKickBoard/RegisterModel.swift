import Foundation
import NMapsMap


struct KickBoardInfo {
  var serialNumber: Int
  var baseRate: String
  var extraFee: String
  var iconImage: NMFOverlayImage = NMFOverlayImage(name: "KickBoardImg")
  var markerInfo: NMFMarker
}
    
    


class KickBoardData {
    static let shared = KickBoardData()
    
    var kickboards: [KickBoardInfo] = []
    
    private init() {}
}
class DeleteMarkInfo {
    static let shared = DeleteMarkInfo()
    
    var marks: [NMFMarker] = []
    
    private init() {}
}
//struct BaseKickBoardData {
//    var baseKickBoard: [NMFMarker] {
//        return KickBoardData.shared.kickboards.map { kickboardInfo in
//            let marker = NMFMarker(position: kickboardInfo.position)
//            marker.iconImage = kickboardInfo.iconImage
//            return marker
//        }
//    }
//}

