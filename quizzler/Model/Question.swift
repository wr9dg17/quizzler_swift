//
//  Question.swift
//  quizzler
//
//  Created by Farid Hamzayev on 22.07.23.
//

import Foundation

struct Question {
  let text: String
  let answer: String
  
  init(q: String, a: String) {
    text = q
    answer = a
  }
}
