import UIKit

class CustomView : UIView {
    
    @IBInspectable var radius: CGFloat = 10 {
           didSet {
               setNeedsDisplay()
           }
       }
       

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
               context.setFillColor(UIColor.red.cgColor)
               context.fillEllipse(in: CGRect(x: rect.midX - radius,
                                              y: rect.midY - radius,
                                              width: radius * 2,
                                              height: radius * 2))
        context.fill(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
    
        }
      
    }

