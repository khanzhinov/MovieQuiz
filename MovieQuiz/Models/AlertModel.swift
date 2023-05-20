//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 20.05.2023.
//

import Foundation

struct AlertModel {
    let title:String
    let message:String
    let buttonText:String
    let completion: (() -> Void)
}
