//
//  SearchResult.swift
//  Trivia
//
//  Created by Aidan Kang on 2023-04-20.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int
    let results: [Trivia]
}

