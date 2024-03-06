//
//  GenresViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 03.02.2024.
//

import UIKit

final class GenresViewController: UIViewController {
    
    @IBOutlet var genresCollectionView: UICollectionView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var networkManager = NetworkManager.shared
    private var genresList: [String] = []
    private var filteredGenres: [String] = []
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        //   self.genresCollectionView.delegate = self
       genresCollectionView.dataSource = self
        setupSearchController()
        fetchGenres()
    }
    
    @IBAction func buttonActionBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    // MARK: - Private Methods
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.font = UIFont.systemFont(ofSize: 15)
            textField.textColor = .white
        }

    }

    private func fetchGenres() {
        networkManager.fetch(Genre.self, from: Link.genresURL.url) { [unowned self] result in
            switch result {
            case .success(let genres):
                if let data = genres.data {
                    genresList = data
                    genresCollectionView.reloadData()
                    activityIndicator.stopAnimating()
                }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

// MARK: - UICollectionViewDataSource
    extension GenresViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            isFiltering ? filteredGenres.count : genresList.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath)
            guard let cell = cell as? GenresCollectionViewCell else { return UICollectionViewCell() }
            let genre = isFiltering ? filteredGenres[indexPath.item] : genresList[indexPath.item]
           
            cell.configure(with: genre)
            return cell
        }
        
    }

// MARK: - UISearchResultsUpdating
extension GenresViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredGenres = genresList.filter { genre in
            genre.lowercased().contains(searchText.lowercased())
        }
        genresCollectionView.reloadData()
    }
    
}

