//
//  ViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import UIKit
import Alamofire

final class MainViewController: UIViewController {
    
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchRandomQuote()
        
    }
    
    @IBAction func buttonDidGenerate() {
        fetchRandomQuote()
    }
    
    
    private func fetchRandomQuote() {
        AF.request(Link.randomQuoteURL.url)
            .validate()
            .responseJSON { [weak self] dataResponse in
                guard let self else { return }
                switch dataResponse.result {
                case .success(let value):
                    guard let quoteInfo = value as? [String: Any],
                          let randomQuotes = quoteInfo["data"] as? [[String: Any]],
                          let randomQuote = randomQuotes.first else {return}
                    
                    
                    let quote = Quote(
                        quoteText: randomQuote["quoteText"] as? String? ?? "",
                        quoteAuthor: randomQuote["quoteAuthor"] as? String? ?? "",
                        quoteGenre: randomQuote["quoteGenre"] as? String? ?? ""
                    )
                    
                    quoteLabel.text = quote.quoteText
                    authorLabel.text = quote.quoteAuthor
                    genreLabel.text = quote.quoteGenre
                    activityIndicator.stopAnimating()
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
}



