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
}

let exampleTrivia = Trivia(category: "Sports", type: "multiple", difficulty: "medium", question: "What is the name of the AHL affiliate of the Toronto Maple Leafs?", correct_answer: "Toronto Marlies")

