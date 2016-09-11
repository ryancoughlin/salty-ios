import PromiseKit
import CoreLocation
import Alamofire

struct NetworkRequest {
    
    let forecastBaseURL = "https://api.forecast.io/forecast"
    let forecastKey = "5ad759e29656a49d5b019059b3233cc9"

    func makeRequest(location: CLLocationCoordinate2D) -> Promise <Dictionary <String, AnyObject>> {
        return Promise { fulfill, reject in
            
            let urlForRequest = "\(forecastBaseURL)/\(forecastKey)/\(location.networkStringFormat())"

            Alamofire.request(.GET, urlForRequest, parameters: nil).validate().responseJSON { response in
                switch response.result {
                case .Success(let value):
                    fulfill(value as! [String: AnyObject])
                case .Failure(let error):
                    reject(error)
                }
            }
        }
    }
}

extension CLLocationCoordinate2D {
    func networkStringFormat() -> String {
        return "\(latitude),\(longitude)"
    }
}