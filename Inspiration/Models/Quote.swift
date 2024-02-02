//
//  Quote.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import Foundation

enum Link {
    case randomQuoteURL
    case authorsURL
    case categoriesURL
    
    var url: URL {
        switch self {
        case .randomQuoteURL:
        return URL(string: "https://quote-garden.onrender.com/api/v3/quotes/random")!
        case .authorsURL:
            return URL(string: "https://quote-garden.onrender.com/api/v3/authors")!
        case .categoriesURL:
            return URL(string: "https://quote-garden.onrender.com/api/v3/genres")!
        }
    }
}

struct Info: Decodable {
    let data: [Quote]
}

struct Quote: Decodable {
    let quoteText: String?
    let quoteAuthor: String?
    let quoteGenre: String?
}


