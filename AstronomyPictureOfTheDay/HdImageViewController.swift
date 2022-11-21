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
        fetchImage()
    }
    private func fetchImage() {
        NetworkManager.shared.fetchImage(from: Link.hdImageURL.rawValue) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.hdImageView.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
     }
    
}
