//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 25.05.2023.
//

import UIKit

 protocol AlertPresenterDelegate: AnyObject {
     func didPresentAlert(alert: UIAlertController?)
 }
