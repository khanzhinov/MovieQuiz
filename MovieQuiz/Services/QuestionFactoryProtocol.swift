//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 16.05.2023.
//

import Foundation

protocol QuestionFactoryProtocol {
     var delegate: QuestionFactoryDelegate? { get set }
     func requestNextQuestion()
     func loadData()
 }




