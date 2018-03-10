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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let titleView = NavigationImageView()
        titleView.image = UIImage(named:"Actions")
        self.navigationItem.titleView = titleView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
