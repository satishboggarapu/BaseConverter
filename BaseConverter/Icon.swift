import UIKit

public struct Icon {

    /// Get the icon by the file name.
    public static func icon(_ name: String) -> UIImage? {
        return UIImage(named: name, in: nil, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
    }

    public static let info_24 = Icon.icon("baseline_info_white_24pt")
}
