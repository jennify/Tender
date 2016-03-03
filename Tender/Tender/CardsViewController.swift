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
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var draggableProfileImageView: DraggableImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let gesture = UIGestureRecognizer(target: self, action: "onGesture:")
//        self.profileImageView.addGestureRecognizer(gesture)
        self.profileImageView.userInteractionEnabled = true

    }

    @IBAction func profileImagePanGesture(sender: UIPanGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began {
            self.originalCenter = self.profileImageView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            self.profileImageView.center = CGPoint(x: self.originalCenter.x + sender.translationInView(view).x, y: originalCenter.y)
        } else if sender.state == UIGestureRecognizerState.Ended {
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

