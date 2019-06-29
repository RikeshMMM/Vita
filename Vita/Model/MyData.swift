
import Foundation

enum Mode {
    case add
    case edit
}

struct MyData {
    var userId: String = ""
     var orderNumber: String = ""
    var address: String = ""
    var name: String = ""
    var progress: String = "intransit"
   // var status: Bool = false // false = in transit, true = completed
   
}
struct NewOrder {
    var number: String = ""
    var iconImage: String = ""
    var title: String = ""
    var subTitle: String  = ""
    var stepCompleted: Bool = false
    var qrScanned: [String] = []
}

struct locationData {
    var street: String = ""
    var city: String = ""
    var state: String = ""
    var country: String = ""
    
}
struct CarrierData {
    var name: String = ""
    var address: String = ""
    var rating: String = ""
    var deliveryNo: String = ""
    
}
