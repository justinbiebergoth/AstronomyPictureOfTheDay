//
//  ViewController.swift
//  AstronomyPictureOfTheDay
//
//  Created by hiirari on 11.11.2022.
//

import UIKit


class AstronomyPictureInfoViewController: UIViewController {
    
    private var AstronomyPictureInfo: AstronomyPicture!
    
    @IBOutlet var astronomyPictureImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    
    @IBOutlet var explanationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
        fetchImage()
        
    }
    
}
extension AstronomyPictureInfoViewController {
    private func fetchImage() {
        NetworkManager.shared.fetchImage(from: AstronomyPictureInfo?.url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.astronomyPictureImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    private func fetchInfo() {
        NetworkManager.shared.fetch(AstronomyPicture.self, from: Link.astronomyPictureInfoURL.rawValue) { [weak self] result in
            switch result{
            case .success(let data):
                self?.titleLabel.text = data.title.description
                self?.dateLabel.text = data.date.description
                self?.explanationTextView.text = data.explanation.description
                self?.copyrightLabel.text = data.copyright?.description
 
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
