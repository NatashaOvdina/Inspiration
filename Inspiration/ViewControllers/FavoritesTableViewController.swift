//
//  FavoritesTableViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 22.02.2024.
//

import UIKit
import RealmSwift

final class FavoritesTableViewController: UITableViewController {
    
    var currentQuote: Quote!
    private let storageManager = StorageManager.shared
    private var favorites: Results<Quote>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        favorites = storageManager.fetchData(Quote.self)
        
        navigationItem.rightBarButtonItem = editButtonItem
        editButtonItem.tintColor = .blackWhite
        
    }
    
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let favQuoteVC = segue.destination as? FavoriteQuoteViewController else { return }
        let favQuote = favorites[indexPath.row]
        favQuoteVC.favoriteQuote = favQuote
      
    }
    
}
    // MARK: - Table view data source
extension FavoritesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let favorites = favorites[indexPath.row]
        content.text = favorites.quoteAuthor
        content.textProperties.font = UIFont(name: "Sometime", size: 25) ?? .systemFont(ofSize: 25)
        content.textProperties.color = .pinkRose
        content.secondaryText = favorites.quoteText
        content.secondaryTextProperties.font = UIFont(name: "Optima Regular", size: 15) ?? .systemFont(ofSize: 15)
        
        cell.contentConfiguration = content
        return cell
    }

}
// MARK: - UITableViewDelegate

extension FavoritesTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath
    ) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            let quote = favorites[indexPath.row]
            storageManager.delete(quote)
        
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
