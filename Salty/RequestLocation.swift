import PromiseKit
import SwiftLocation
import CoreLocation

struct RequestLocation {
    func requestUserLocation() -> Promise <CLLocationCoordinate2D> {
        return Promise { fulfill, reject in
            LocationManager.shared.observeLocations(.City, frequency: .OneShot, onSuccess: { location in
                fulfill(location.coordinate)
            }) { error in
                reject(error)
            }
        }
    }
    
    func requestCityName(coordinates: CLLocationCoordinate2D) -> Promise <String> {
        return Promise { fulfill, reject in
            LocationManager.shared.reverseLocation(service: .Google, coordinates: coordinates, onSuccess: { foundPlacemark in
                guard let city = foundPlacemark.locality else {
                    return fulfill("No city")
                }
                
                fulfill(city)

            }) { error in
                reject(error)
            }
        }
    }
}
