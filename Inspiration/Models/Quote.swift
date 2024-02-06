//
//  Quote.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import Foundation
import Alamofire

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
    
    init(data: [Quote]) {
        self.data = data
    }
    
}

struct Quote: Decodable {
    let quoteText: String?
    let quoteAuthor: String?
    let quoteGenre: String?
    
    init(quoteText: String?, quoteAuthor: String?, quoteGenre: String?) {
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
        self.quoteGenre = quoteGenre
    }
    
    init(randomQuote: [String: Any]) {
        quoteText = randomQuote["quoteText"] as? String? ?? ""
        quoteAuthor = randomQuote["quoteAuthor"] as? String? ?? ""
        quoteGenre = randomQuote["quoteGenre"] as? String? ?? ""
    }
    
    
}
    struct Genre: Decodable {
        let data: [String]?
        
        init(data: [String]?) {
            self.data = data
        }
        
        init(genres: [String: Any]) {
            data = genres["data"] as? [String] ?? []
        }
        
    }
    
    

