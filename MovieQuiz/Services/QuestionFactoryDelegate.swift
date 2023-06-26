//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 17.05.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
     func didReceiveNextQuestion(question: QuizQuestion?)
     func didLoadDataFromServer() // сообщение об успешной загрузке
     func didFailToLoadData(with error: Error) // сообщение об ошибке загрузки
 }
