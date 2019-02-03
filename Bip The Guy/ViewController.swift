//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Jason Tee on 2/2/19.
//  Copyright © 2019 Jason Tee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgaeToPunch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Mark: Functions
    func animateImage() {
        let bounds = self.imgaeToPunch.bounds
        let shrinkValue: CGFloat = 60
        //shrink image to punchg by shrinkValue pixels
        self.imgaeToPunch.bounds = CGRect(x: self.imgaeToPunch.bounds.origin.x
            + shrinkValue, y: self.imgaeToPunch.bounds.origin.y + shrinkValue, width: self.imgaeToPunch.bounds.size.width - shrinkValue, height: self.imgaeToPunch.bounds.size.height - shrinkValue)
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imgaeToPunch.bounds = bounds}, completion: nil)
    }
    
    
    
    //Mark: Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
    }
}

