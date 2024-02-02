//
//  Quote.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import Foundation

let url = URL(string: "https://quote-garden.onrender.com/api/v3/quotes")!

struct Info: Decodable {
    let data: [Quote]
}

struct Quote: Decodable {
    let quoteText: String?
    let quoteAuthor: String
    let quoteGenre: String
}


