//
//  ViewController.swift
//  Tender
//
//  Created by Jennifer Lee on 3/2/16.
//
//

import UIKit

class CardsViewController: UIViewController {
    var originalCenter: CGPoint!
    var originalTranform: CGAffineTransform!
    @IBOutlet weak var profileView: DraggableImageView!
    
    
    @IBOutlet weak var draggableProfileImageView: DraggableImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    @IBAction func profileImagePanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let point = sender.locationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            self.originalCenter = self.profileView.center
            self.originalTranform = self.profileView.transform
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            var multiplier = 1.0
            if point.y < view.frame.height/2 {
                multiplier = -1.0
            } else {
                multiplier = 1.0
            }
            self.profileView.center = CGPoint(x: self.originalCenter.x + sender.translationInView(view).x, y: originalCenter.y)
            let xOffset = translation.x
            print(xOffset)
            let angle = CGFloat(multiplier * 1 * M_PI/180) / 20 * xOffset
            self.profileView.transform = CGAffineTransformRotate(originalTranform, angle)
        
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            if translation.x > 50 || translation.x < -50 {
                self.profileView.hidden = true
            } else {
                self.profileView.transform = originalTranform
                self.profileView.center = originalCenter
            }
        }
        
    }
    
    @IBAction func tapGesture(sender: UITapGestureRecognizer) {
        let profileDetail = ProfileViewController(nibName: "ProfileViewController", bundle: NSBundle.mainBundle())
        
        self.presentViewController(profileDetail, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

