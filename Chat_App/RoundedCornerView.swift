//
//  RoundedCornerView.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 15/08/2022.
//

import UIKit
@IBDesignable
class RoundedCornerView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
    
    
}
@IBDesignable
 class RoundedButton: UIButton
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
     @IBInspectable override var clipsToBounds : Bool {
         didSet {
             clipsToBounds = clipsToBounds ? true : false
         }
     }
     
//     //Shadow
//     @IBInspectable var shadowColor: UIColor? {
//         didSet {
//             layer.shadowColor = shadowColor?.cgColor
//         }
//     }
//     @IBInspectable var shadowOpacity: CGFloat = 0 {
//         didSet {
//             layer.shadowOpacity = Float(shadowOpacity)
//         }
//     }
//     @IBInspectable var shadowRadius: CGFloat = 0 {
//         didSet {
//             layer.shadowRadius = shadowRadius
//         }
//     }
//
//     @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3) {
//         didSet {
//             layer.shadowOffset = shadowOffset
//         }
//     }
     
//     // shadow
//     blueView.layer.shadowOffset = CGSize(width: 3, height: 3)

}

@IBDesignable
 class RoundedText: UITextField
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
     @IBInspectable override var clipsToBounds : Bool{
         didSet {
             clipsToBounds = clipsToBounds
         }
     }
}

@IBDesignable
class RoundedImage: UIImageView
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
}
@IBDesignable
class RoundedTableView: UITableView
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
}
@IBDesignable
class RoundedCollectionView: UICollectionView
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
}
@IBDesignable
class RoundedLabel: UILabel
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }

    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
   
}

@IBDesignable
class RoundedTextView: UITextView
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
}
@IBDesignable
class RoundedStackView: UIStackView
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
}

@IBDesignable
class RoundedTableViewCell: UITableViewCell
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
}
@IBDesignable
class RoundedCollectionViewCell: UICollectionViewCell
{
    @IBInspectable var cornerRadius: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadius
              layer.masksToBounds = cornerRadius > 0
          }
      }
      
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
      
      @IBInspectable var borderColor: UIColor? {
          didSet {
              layer.borderColor = borderColor?.cgColor
          }
      }
    @IBInspectable override var clipsToBounds : Bool{
        didSet {
            clipsToBounds = clipsToBounds
        }
    }
}
