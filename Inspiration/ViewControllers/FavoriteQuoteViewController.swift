//
//  FavoriteQuoteViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 27.02.2024.
//

import UIKit
import RealmSwift

final class FavoriteQuoteViewController: UIViewController {
    
   var favoriteQuote: Quote!

    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }
    
    private func configureLabels() {
        authorLabel.text = favoriteQuote.quoteAuthor
        quoteLabel.text = favoriteQuote.quoteText
        genreLabel.text = favoriteQuote.quoteGenre
    }
    
    @IBAction func buttonActionBack() {
        dismiss(animated: true)
    }
    
}
