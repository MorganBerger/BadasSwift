//
//  AwesomePageControl.swift
//  YouCare
//
//  Created by Morgan Berger on 12/07/2018.
//  Copyright © 2018 Morgan Berger. All rights reserved.
//

import UIKit

//MARK: - Custom Delegate method.
@objc protocol AwesomePageControlDelegate:class {
    @objc optional func didTapControlAtIndex(_ index:Int) -> Void
}

class AwesomePageControl: UIView {
    
    //MARK: - IBOutlets declarations
    @IBOutlet weak var backBarView: UIView!
    @IBOutlet weak var cursorView: UIView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    //MARK: - Variables declarations
    var delegate:AwesomePageControlDelegate?
    
    var wasDrawn:Bool = false
    var buttons:[UIButton?] = []
    var cursorPos:Int = 1;
    var buttonsImagesNames:[String?] = ["pgControlIncognito", "pgControlRegularTabs"]
    var cursorWidth: CGFloat = 0.0
    var cursorX:CGFloat? {
        set {
            var frame = self.cursorView?.frame
            frame?.origin.x = (newValue)!
            self.cursorView?.frame = frame!
        }
        get {
            return -1.0
        }
    }
    
    //MARK: - Init methods
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if (self.subviews.count == 0) {
            load()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if (self.subviews.count == 0) {
            load()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        if (self.subviews.count == 0) {
            load()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func load() {
    
        let bundle = Bundle(for: self.classForCoder)
        let nib:UIView = UINib(nibName: "AwesomePageControl", bundle: bundle).instantiate(withOwner: self, options: nil).first as! UIView
        
        nib.frame = self.bounds
        
        self.addSubview(nib)
    }
    
    func setup() {
        
        var i = 1
        
        for button in (buttonsStackView?.subviews)! {
            if button is UIButton {
                (button as? UIButton)?.addTarget(self, action: #selector(didTapButton(_:)), for: UIControlEvents.touchUpInside)
                (button as? UIButton)?.adjustsImageWhenHighlighted = false
                buttons.append(button as? UIButton)
            }
            i += 1
        }
    }
    
    //MARK: - Draw methods
    override func draw(_ rect: CGRect) {
        
        if !wasDrawn {
            backBarView?.layer.cornerRadius = 12
            
            let w = ((buttonsStackView?.frame.size.width)! / CGFloat((buttonsStackView?.subviews.count)!)) + ((buttonsStackView?.frame.origin.x)! * 2)
            
            cursorView?.frame = CGRect(x: 0, y: 0, width: w, height: cursorView.frame.size.height)
            cursorView?.layer.cornerRadius = 12
            
            buttons[1]?.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
            buttons[1]?.imageView?.contentMode = .scaleAspectFit
            
            let tabNumber = (buttons[1]?.titleLabel?.text == nil ? 0 : Int((buttons[1]?.titleLabel?.text)!))
            
            setTabsNumber(nb: tabNumber!)
            setCursorPosition(self.cursorPos, animated:false)
            
            wasDrawn = true
        }
    }
 
    func setTabsNumber(nb: Int) {
        
        let txt = (nb > 0 ? "\(nb)" : "")
        var titleInsets = UIEdgeInsets(top: 0, left: 0, bottom:0, right: 0)
        var imageInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        buttons[1]?.setTitle(txt, for: .normal)
        
        if (nb > 0) {
            guard let imageSize = self.buttons[1]?.imageView?.image?.size,
                let text = self.buttons[1]?.titleLabel?.text,
                let font = self.buttons[1]?.titleLabel?.font
                else { return }
            
            titleInsets.right = (imageSize.width + 1) / 2
            titleInsets.left  = -(imageSize.width + 1) / 2
            
            let labelString = NSString(string: text)
            let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
            
            imageInsets.left = ((titleSize.width) / 2) + 5
            imageInsets.right = -((titleSize.width + 1) / 2) + 5
        }
        buttons[1]?.titleEdgeInsets = titleInsets
        buttons[1]?.imageEdgeInsets = imageInsets
    }
    
    func setCursorPosition(_ index:Int, animated:Bool) {
        
        self.cursorPos = index;
        
        resetImages([index])
        
        var x:CGFloat = 0.0
        
        if (index == 0) {
            x = CGFloat(index)
        }
        
        x = (buttons[index]?.frame.origin.x)!
        
        UIView.animate(withDuration: (animated ? 0.2 : 0.0)) {
            self.cursorX = x
        }
        
        let imageName = "\(self.buttonsImagesNames[index]!)Selected"
        
        UIView.transition(with: buttons[index]!, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            
            let bundle = Bundle(for: self.classForCoder)
            self.buttons[index]?.setImage(UIImage(named: imageName, in: bundle, compatibleWith: nil), for: .normal)
            self.buttons[index]?.setTitleColor(UIColor.black, for: .normal)
        }) { (finished) in
            
        }
    }
    
    func resetImages(_ exceptions:[Int]) {

        for i in 0..<buttons.count {
            
            var imgShouldChange:Bool = true
            
            for y in 0..<exceptions.count {
                if exceptions[y] == i {
                    imgShouldChange = false
                    break
                }
            }
            
            if (imgShouldChange) {
                let imgName = "\(buttonsImagesNames[i]!)NonSelected"
                
                let bundle = Bundle(for: self.classForCoder)
                let defaultImg = UIImage(named: imgName, in: bundle, compatibleWith: nil)
                
                buttons[i]?.setImage(defaultImg, for: .normal)
                buttons[i]?.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }

    //MARK: - IBAction methods
    @objc func didTapButton(_ sender:UIButton) {
        let index = buttons.firstIndex(of: sender)!
        
        delegate?.didTapControlAtIndex?(index)
        setCursorPosition(index, animated: true)
    }
}
