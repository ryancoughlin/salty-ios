import PromiseKit
import Argo
import Runes

struct DecodeCurrently {
    func decodeCurrentWeather(json: [String: AnyObject]) -> Promise <Decoded <CurrentWeather>> {
        return Promise { fulfill, reject in
            let currentWeather: Decoded <CurrentWeather> = decode(json, rootKey: "currently")
            fulfill(currentWeather)
        }
    }
}