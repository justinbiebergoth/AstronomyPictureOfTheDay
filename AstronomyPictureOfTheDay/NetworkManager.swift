//
//  NetworkManager.swift
//  AstronomyPictureOfTheDay
//
//  Created by hiirari on 20.11.2022.
//

import Foundation
import Alamofire


enum Link: String {
    case astronomyPictureInfoURL = "https://go-apod.herokuapp.com/apod"
    case hdImageURL = "https://go-apod.herokuapp.com/image"
    case directUrl = "https://apod.nasa.gov/apod/image/2206/MarsFingers_Curiosity_1338.jpg"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, completion: @escaping(Result<AstronomyPicture, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: AstronomyPicture.self) { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let astronomyPictureInfo = AstronomyPicture.getData(from: value)
                    completion(.success(astronomyPictureInfo))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
       
    }
    
}
