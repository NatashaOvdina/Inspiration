//
//  NavigationTableViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 20.02.2024.
//

import UIKit

final class NavigationTableViewController: UITableViewController {
    
    private let navigationInfo = DataStore.shared.navigationList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
    }
    
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
// MARK: - Table view data source

extension NavigationTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        navigationInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "navigationCell", for: indexPath)
        let navigation = navigationInfo[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = navigation.header
        content.secondaryText = navigation.footer
        content.image = UIImage(systemName: navigation.image)?.withTintColor(.pinkRose, renderingMode: .alwaysOriginal)
        content.textProperties.font = .boldSystemFont(ofSize: 20)
        content.secondaryTextProperties.font = UIFont(name: "Optima Regular", size: 16) ?? .systemFont(ofSize: 15)
        cell.contentConfiguration = content
       
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension NavigationTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
