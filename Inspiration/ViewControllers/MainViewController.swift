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
    
    private let networkManager = NetworkManager.shared
    private var quotes: [Quote] = []
    
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
        networkManager.fetchRandomQuote(from: Link.randomQuoteURL.url) { [weak self ] result in
            guard let self else { return }
            switch result {
            case .success(let quotes):
                self.quotes = quotes
        
                quoteLabel.text = quotes.first?.quoteText
                authorLabel.text = quotes.first?.quoteAuthor
                genreLabel.text = quotes.first?.quoteGenre
                
                activityIndicator.stopAnimating()
             
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
}


