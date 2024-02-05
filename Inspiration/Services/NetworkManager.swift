//
//  NetworkManager.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 02.02.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
 
    private init() {}
    
    func fetchQuote() {
        AF.request(Link.randomQuoteURL.url)
            .validate()
            .responseJSON { [unowned self]dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let randomQuoteInfo = value as? [String:Any] else {return}
                    
                        let quoteInfo = Quote(
                            quoteText: randomQuoteInfo["quoteText"] as? String ?? "",
                            quoteAuthor: randomQuoteInfo["quoteAuthor"] as? String ?? "",
                            quoteGenre: randomQuoteInfo["quoteGenre"] as? String ?? "")
                        
                
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}
