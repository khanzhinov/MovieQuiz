//
//  MostPopularMovies.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 29.05.2023.
//

import Foundation

struct MostPopularMovies: Codable {
    let errorMessage: String
    let items: [MostPopularMovies]
}


struct MostPopularMovie {
    let title: String
    let rating: String
    let imageURL : URL
}
    
    private enum CodingKeys: String, CodingKey {
    case title = "fullTitle"
    case rating = "imDbRating"
    case imageURL = "image"
    }

