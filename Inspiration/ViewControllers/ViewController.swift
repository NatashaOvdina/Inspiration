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
    
    private var networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRandomQuote()
        
    }
    
    private func fetchRandomQuote() {
        URLSession.shared.dataTask(with: Link.randomQuoteURL.url) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error ?? "No error description")
                return
            }
    
            do {
                let info = try JSONDecoder().decode(Quote.self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.quoteLabel.text = info.quoteText
                    self.authorLabel.text = info.quoteAuthor
                    self.genreLabel.text = info.quoteGenre
                    
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
}
