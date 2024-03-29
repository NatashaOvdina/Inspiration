//
//  Quote.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import Foundation
import RealmSwift

enum Link {
    case randomQuoteURL
    case authorsURL
    case genresURL
    
    var url: URL {
        switch self {
        case .randomQuoteURL:
        return URL(string: "https://quote-garden.onrender.com/api/v3/quotes/random")!
        case .authorsURL:
            return URL(string: "https://quote-garden.onrender.com/api/v3/authors")!
        case .genresURL:
            return URL(string: "https://quote-garden.onrender.com/api/v3/genres")!
        }
    }
}

struct Info: Decodable {
    let data: [Quote]
}

final class Quote: Object, Decodable {
    @Persisted var quoteText: String?
    @Persisted var quoteAuthor: String?
    @Persisted var quoteGenre: String?
}


struct Genre: Decodable {
    let data: [String]?
}


