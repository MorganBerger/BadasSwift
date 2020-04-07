//
//  UIView+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit


public extension UIView {

    //MARK: - Shorcut to frame values with setters.
    
    var width: CGFloat {
        get { return self.frame.size.width }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get { return self.frame.size.height }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var size: CGSize  {
        get { return self.frame.size }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    var origin: CGPoint {
        get { return self.frame.origin }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var y: CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get { return self.center.x }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get { return self.center.y }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    var top : CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /*public var bottom : CGFloat {
     get { return frame.origin.y + frame.size.height }
     set {
     print(newValue)
     self.height = newValue - self.top
     }
     }
     
     public var right : CGFloat {
     get { return self.frame.origin.x + self.frame.size.width }
     set {
     
     self.width = 300.0//newValue - self.left
     
     }
     }  working on it */
    
    var left : CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x  = newValue
            self.frame = frame
        }
    }
    
    // MARK: - Customizing UI methods
    
    func removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func showWithDuration(_ duration:Double) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration) {
                self.alpha = 1.0
            }
        }
    }
    func hideWithDuration(_ duration:Double) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration) {
                self.alpha = 0.0
            }
        }
    }
    
    func showWithDuration(_ duration:Double, completion:@escaping () -> Void) {
        DispatchQueue.main.sync {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1.0
            }, completion: { (finished) in
                completion()
            })
        }
    }
    func hideWithDuration(_ duration:Double, completion:@escaping () -> Void) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 0.0
            }, completion: { (finished) in
                completion()
            })
        }
    }
    
    // Animate corner radius on any instanciated UIView
    func addCornerRadiusAnimation(to: CGFloat, duration: CFTimeInterval)
    {
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.fromValue = layer.cornerRadius
        animation.toValue = to
        animation.duration = duration
        layer.add(animation, forKey: "cornerRadius")
        layer.cornerRadius = to
    }
    
    func putBorders(color:UIColor) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
    }
    
    enum GradientDirection:Int {
        case horizontal = 0
        case vertical
        case diagonalDesc
        case diagonalAsc
    }
    
    func putGradient(dir:UIView.GradientDirection, frame:CGRect, colors:[CGColor]) {
        
        let gradient:CAGradientLayer = CAGradientLayer()
        
        gradient.frame = frame
        gradient.colors = colors;
        
        gradient.cornerRadius = self.layer.cornerRadius
        
        let startPoint:CGPoint!
        let endPoint:CGPoint!
        
        switch dir {
        case .horizontal:
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
            break
        case .vertical:
            startPoint = CGPoint(x: 0.5, y: 0.0)
            endPoint = CGPoint(x: 0.5, y: 1.0)
            break
        case .diagonalDesc:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 1.0, y: 1.0)
            break
        case .diagonalAsc:
            startPoint = CGPoint(x: 0.0, y: 1.0)
            endPoint = CGPoint(x: 1.0, y: 0.0)
            break
        }
        
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func putGradient(direction:UIView.GradientDirection , colors:CGColor...) {
        self.putGradient(dir: direction, frame: self.bounds, colors: colors)
    }
    
    var rootView:UIView {
        var view = self
        while view.superview != nil {
            view = view.superview!
        }
        return view
    }
    
    @discardableResult
    func addBorders(edges: UIRectEdge,
                    color: UIColor,
                    inset: CGFloat = 0.0,
                    thickness: CGFloat = 1.0) -> [UIView] {
        
        var borders = [UIView]()
        
        @discardableResult
        func addBorder(formats: String...) -> UIView {
            let border = UIView(frame: .zero)
            border.backgroundColor = color
            border.translatesAutoresizingMaskIntoConstraints = false
            addSubview(border)
            addConstraints(formats.flatMap {
                NSLayoutConstraint.constraints(withVisualFormat: $0,
                                               options: [],
                                               metrics: ["inset": inset, "thickness": thickness],
                                               views: ["border": border]) })
            borders.append(border)
            return border
        }
        
        if edges.contains(.top) || edges.contains(.all) {
            addBorder(formats: "V:|-0-[border(==thickness)]", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(formats: "V:[border(==thickness)]-0-|", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.left) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:|-0-[border(==thickness)]")
        }
        if edges.contains(.right) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:[border(==thickness)]-0-|")
        }
        
        return borders
    }
    
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    @available(iOS 10.0, *)
    func toImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
