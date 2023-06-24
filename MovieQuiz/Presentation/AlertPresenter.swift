//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 20.05.2023.
//

import UIKit

struct AlertPresenter {
    weak var controller: UIViewController?
    func show(alert model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert)
        
        alert.view.accessibilityIdentifier = "Alert"
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default,
            handler: model.completion)
        
        alert.addAction(action)
        controller?.present(alert, animated: true, completion: nil)
    }
}



