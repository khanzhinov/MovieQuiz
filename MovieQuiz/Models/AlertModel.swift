//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 20.05.2023.
//

import Foundation
import UIKit

struct AlertModel {
    let title:String
    let message:String
    let buttonText:String
    let completion: ((UIAlertAction) -> Void)?
}


