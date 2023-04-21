//
//  Trivia.swift
//  Trivia
//
//  Created by Aidan Kang on 2023-04-20.
//

import Foundation

struct Trivia: Codable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

let exampleTrivia = Trivia(category: "Mythology",
                           type: "multiple",
                           difficulty: "medium",
                           question: "Which greek god/goddess tossed a golden apple with the words 'for the fairest' into the middle of the feast of the gods?",
                           correct_answer: "Eris",
                           incorrect_answers: ["Hades", "Ares", "Artemis"])
