//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Валерия Медведева on 25.05.2023.
//

import Foundation

 struct GameRecord: Codable {
      let correct: Int
      let total: Int
      let date: Date
  }

  extension GameRecord: Comparable {
      static func < (lhs: GameRecord, rhs: GameRecord) -> Bool {
          return lhs.correct < rhs.correct
      }
  }
