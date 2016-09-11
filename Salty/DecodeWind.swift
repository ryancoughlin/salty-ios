import PromiseKit
import Argo
import Runes

struct DecodeWind {
    func decodeWind(json: [String: AnyObject]) -> Promise <Decoded <Array <Wind>>> {
        return Promise { fulfill, reject in
            if let hourly = json["hourly"] as? [String: AnyObject] {
                let winds: Decoded <[Wind]> = decode(hourly, rootKey: "data")
                fulfill(winds)
            }
        }
    }
}