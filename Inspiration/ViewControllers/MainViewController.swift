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
                    guard let quoteInfo = value as? [ String: Any ] else { return }
                    
                    let quote = Quote(
                        quoteText: quoteInfo["quoteText"] as? String ?? "",
                        quoteAuthor: quoteInfo["quoteAuthor"] as? String ?? "",
                        quoteGenre: quoteInfo["quoteGenre"] as? String ?? ""
                    )
                    
                    let info = Info(data: [quote])
                    
                    quoteLabel.text = info.data.first?.quoteText
                    authorLabel.text = info.data.first?.quoteAuthor
                    genreLabel.text = info.data.first?.quoteGenre
                    activityIndicator.stopAnimating()
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}
