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
   
    func fetchRandomQuote(from url: URL, completion: @escaping(Result<[Quote], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let quotes = Quote.getRandomQuote(from: value)
                    completion(.success(quotes))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func fetchGenres(from url: URL, completion: @escaping(Result<[Genre], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let genres = Genre.getGenres(from: value)
                    completion(.success(genres))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
