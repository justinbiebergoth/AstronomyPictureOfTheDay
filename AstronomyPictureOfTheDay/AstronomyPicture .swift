//
//  AstronomyPicture .swift
//  AstronomyPictureOfTheDay
//
//  Created by hiirari on 11.11.2022.
//

struct AstronomyPicture: Decodable {
    let date: String
    let copyright: String?
    let explanation: String
    let title: String
    let url: String
    let hdurl: String
}
