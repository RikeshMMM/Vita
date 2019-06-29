
import UIKit
enum MenuOption: Int, CustomStringConvertible{
    case Profiles
    case Inbox
    case Notifications
    case Settings
    var description: String {
        switch self {
        case .Profiles:  return "Profiles"
        case .Inbox:   return  "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
          case .Profiles: return  UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
          case .Inbox: return  UIImage(named: "ic_mail_outline_white_2x.png") ?? UIImage()
          case .Notifications: return  UIImage(named: "ic_menu_white_3x.png") ?? UIImage()
          case .Settings: return  UIImage(named: "baseline_settings_white_24dp.png") ?? UIImage()
        }
        }
}
