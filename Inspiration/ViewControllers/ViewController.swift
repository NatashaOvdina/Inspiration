//
//  ViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    
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
        networkManager.fetch(Info.self, from: Link.randomQuoteURL.url) { result in
            switch result {
            case .success(let info):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    quoteLabel.text = info.data.first?.quoteText
                    authorLabel.text = info.data.first?.quoteAuthor
                    genreLabel.text = info.data.first?.quoteGenre
                    activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    
}
