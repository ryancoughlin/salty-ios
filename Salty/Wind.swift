import Argo
import Runes
import Curry

struct Wind {
    var direction: Int
    var speed: Int
    var time: NSDate
}

extension Wind: Decodable {
    static func decode(j: JSON) -> Decoded<Wind> {
        let c = curry(Wind.init)
        return c
            <^> j <| "windBearing"
            <*> j <| "windSpeed"
            <*> j <| "time"
    }
}

extension NSDate: Decodable {
    public static func decode(json: JSON) -> Decoded<NSDate> {
        switch json {
        case let .Number(dateString):
            return .fromOptional(NSDate.init(timeIntervalSinceReferenceDate: dateString.doubleValue))
        default:
            return .typeMismatch("String", actual: json)
        }
    }
}

private let dateFormatter: NSDateFormatter = {
    let dateFormatter = NSDateFormatter()
    
    dateFormatter.dateFormat = "SSSSSSSSSS"
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    
    return dateFormatter
}()

private let date: NSDate = {
    let date = NSDate()
    
    date.timeIntervalSinceReferenceDate
    
    return date
}()