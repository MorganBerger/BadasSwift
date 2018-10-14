import UIKit

extension UIViewController {
    
    // Change the status bar color at any time!
    public func setStatusBarColor(_ color:UIColor) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
}
