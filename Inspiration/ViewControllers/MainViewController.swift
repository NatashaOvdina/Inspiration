//
//  ViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var heartButton: UIButton!
    
    private var networkManager = NetworkManager.shared
    private let storageManager = StorageManager.shared
    
    private var isFavorite = false
    var currentQuote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchRandomQuote()
        
    }
    
    @IBAction func buttonDidGenerate() {
        fetchRandomQuote()
    }
    
    @IBAction func heartButtonAction(_ sender: UIButton) {
        guard let currentQuote else { return }
        storageManager.save(currentQuote)
        isFavorite = true
        heartButton.tintColor = .red
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
                    
                    currentQuote = info.data.first
                    activityIndicator.stopAnimating()
                    
                    isFavorite = false
                    heartButton.tintColor = .black
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
