import PromiseKit
import UIKit
import Argo

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RequestLocation().requestUserLocation().then { locationCoordinate in
            return NetworkRequest().makeRequest(locationCoordinate)
        }.then { weatherJSON -> Promise<(Decoded <[Wind]>, Decoded <CurrentWeather>)> in
            let decodeWind = DecodeWind().decodeWind(weatherJSON)
            let decodeCurrently = DecodeCurrently().decodeCurrentWeather(weatherJSON)

            return when(decodeWind, decodeCurrently)
        }.then { wind, currently in
            print(wind.value, currently.value)
        }
    }
}
