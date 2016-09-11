import CoreLocation
import Geofire
import PromiseKit

struct StationLookup {
    func findStationNearUser(location: CLLocationCoordiante2d) -> Primse <String> {
        return Promise { fulfill, reject in
            let geofireRef = FIRDatabase.database().reference()
            let geoFire = GeoFire(firebaseRef: geofireRef)
            
            let center = CLLocation(latitude: location.coordinate.latitude, longitude: coordinate.location.longitude)
            let circleQuery = geoFire.queryAtLocation(center, withRadius: 0.6)
            
            let span = MKCoordinateSpanMake(0.001, 0.001)
            let region = MKCoordinateRegionMake(center.coordinate, span)
            var regionQuery = geoFire.queryWithRegion(region)
            
            let stationHandler = query.observeEventType(.KeyEntered, withBlock: { (key: String!, location: CLLocation!) in
                print("station found", key)
            })
        }
    }
}
