//
//  Trivia.swift
//  Trivia
//
//  Created by Aidan Kang on 2023-04-20.
//

import Foundation

struct Trivia: Identifiable {
    let id: Int
    let anwer: String
    let question: String
    let value: Int
}

let exampleTrivia = Trivia(id: 41374,
                           anwer: "the Flying Dutchman",
                           question: "\"The Rime of the Ancient Mariner\" was based on the legend of this ghost ship",
                           value: 400)
