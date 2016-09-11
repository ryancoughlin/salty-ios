import Argo
import Runes
import Curry

struct CurrentWeather {
    var temperature: Int
    var summary: String
}

extension CurrentWeather: Decodable {
    static func decode(j: JSON) -> Decoded<CurrentWeather> {
        let c = curry(CurrentWeather.init)
        return c
            <^> j <| "temperature"
            <*> j <| "summary"
    }
}