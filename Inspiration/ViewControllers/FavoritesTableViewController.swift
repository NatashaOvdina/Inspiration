//
//  FavoritesTableViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 22.02.2024.
//

import UIKit
import RealmSwift

final class FavoritesTableViewController: UITableViewController {
    
    private let storageManager = StorageManager.shared
    private var favorites: Results<Quote>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      favorites = storageManager.fetchData(Quote.self)

        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let favorites = favorites[indexPath.row]
        content.text = favorites.quoteAuthor
        content.secondaryText = favorites.quoteText
        
        cell.contentConfiguration = content
        return cell
    }

}
