//
//  Trivia.swift
//  Trivia
//
//  Created by Aidan Kang on 2023-04-20.
//

import Foundation

struct Trivia: Identifiable, Codable {
    let id: Int
    let answer: String
    let question: String
    let value: Int
}

let exampleTrivia = Trivia(id: 41374,
                           answer: "the Flying Dutchman",
                           question: "\"The Rime of the Ancient Mariner\" was based on the legend of this ghost ship",
                           value: 400)
