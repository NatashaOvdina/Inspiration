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

struct Quote: Decodable {
    let quoteText: String?
    let quoteAuthor: String?
    let quoteGenre: String?
    
    init(quoteText: String?, quoteAuthor: String?, quoteGenre: String?) {
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
        self.quoteGenre = quoteGenre
    }
    
    init(quoteDetails: [String: Any]) {
        quoteText = quoteDetails["quoteText"] as? String ?? ""
        quoteAuthor = quoteDetails["quoteAuthor"] as? String ?? ""
        quoteGenre = quoteDetails["quoteGenre"] as? String ?? ""
    }
    
    static func getRandomQuote(from value: Any) -> Quote {
        var quoteInfo: [String: Any] = [:]
        
        let quote = Quote(quoteDetails: quoteInfo)
        quoteInfo.
    }
}


struct Genre: Decodable {
    let data: [String]?
    
    init(data: [String]?) {
        self.data = data
    }
}


