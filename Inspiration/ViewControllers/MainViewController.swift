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
        
        
        
    }
}
