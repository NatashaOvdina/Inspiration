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

struct Info {
    let data: [Quote]

}

struct Quote: Decodable {
    let quoteText: String?
    let quoteAuthor: String?
    let quoteGenre: String?
    
    init(randomQuote: [String: Any]) {
        quoteText = randomQuote["quoteText"] as? String? ?? ""
        quoteAuthor = randomQuote["quoteAuthor"] as? String? ?? ""
        quoteGenre = randomQuote["quoteGenre"] as? String? ?? ""
    }
    
    static func getRandomQuote(from value: Any) -> [Quote] {
        guard let value = value as? [String: Any] else { return []}
        guard let data = value["data"] as?  [[String: Any]] else { return [] }
        
        return data.map { Quote(randomQuote: $0)}
        
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
        
        static func getGenres(from value: Any) -> [Genre] {
            guard let value = value as? [String: Any] else { return []}
            guard let genres = value["data"] as? [String] else { return []}
    
            let genreNames = genres.map {_ in Genre(data: genres)}
            return genreNames
        }
        
    }
    


