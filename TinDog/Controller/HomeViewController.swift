//
//  HomeViewController.swift
//  TinDog
//
//  Created by Linder on 3/9/18.
//  Copyright © 2018 Linder. All rights reserved.
//

import UIKit

class NavigationImageView :UIImageView {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 76, height: 39)
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var homewrapper: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let titleView = NavigationImageView()
        titleView.image = UIImage(named:"Actions")
        self.navigationItem.titleView = titleView
        
        let homeGR = UIPanGestureRecognizer(target: self, action: #selector(cardDragged(gestureReconizer:)))
        self.cardView.addGestureRecognizer(homeGR)
        
    }
    
    @objc func cardDragged(gestureReconizer : UIPanGestureRecognizer) {
        //print("Drag \(gestureReconizer.translation(in: view))")
        let cardPoint = gestureReconizer.translation(in: view)
        self.cardView.center = CGPoint(x: self.view.bounds.width / 2 + cardPoint.x, y: self.view.bounds.height / 2 + cardPoint.y)
        
        let xFromCenter = self.view.bounds.width / 2 - self.cardView.center.x
        var rotate = CGAffineTransform(rotationAngle: xFromCenter / 200)
        let scale = min(100 / abs(xFromCenter), 1)
        var finalTransform = rotate.scaledBy(x: scale, y: scale)
        self.cardView.transform = finalTransform
        
        if gestureReconizer.state == .ended {
            if self.cardView.center.x < (self.view.bounds.width / 2 - 100) {
                print("Dislike")
            }
            
            if self.cardView.center.x > (self.view.bounds.width / 2 + 100) {
                print("Like")
            }
            
            rotate = CGAffineTransform(rotationAngle: 0)
            finalTransform = rotate.scaledBy(x: 1, y: 1)
            self.cardView.transform = finalTransform
            self.cardView.center = CGPoint(x: self.homewrapper.bounds.width / 2 , y: (self.homewrapper.bounds.height / 2) - 30)
         }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
