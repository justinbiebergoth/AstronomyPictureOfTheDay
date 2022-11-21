//
//  HdImageViewController.swift
//  AstronomyPictureOfTheDay
//
//  Created by hiirari on 20.11.2022.
//

import UIKit

class HdImageViewController: UIViewController {
    

    @IBOutlet var hdImageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
 
    }
}
