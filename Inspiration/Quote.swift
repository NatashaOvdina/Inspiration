//
//  Quote.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import Foundation

struct Info: Decodable {
    let data: [Quote]
}

struct Quote: Decodable {
    let quoteText: String?
    let quoteAuthor: String
    let quoteGenre: String
}


