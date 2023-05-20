//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 20.05.2023.
//

import Foundation
import UIKit

protocol AlertPresenterProtocol: AnyObject {
    func show (whit model: AlertModel)
}


class AlertPresenter: AlertPresenterProtocol {
    private weak var viewController:UIViewController?
    init (viewController: UIViewController? ) {
        self.viewController = viewController
    }
    
    func show (whit model: AlertModel) {
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        let action = UIAlertAction(title: model.buttonText, style: .default) { _ in
            model.ending ()
        }
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
        
        
        
