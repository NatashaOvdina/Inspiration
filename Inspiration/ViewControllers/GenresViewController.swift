//
//  GenresViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 03.02.2024.
//

import Foundation
import UIKit

final class GenresViewController: UIViewController {
    
    @IBOutlet var genresCollectionView: UICollectionView!
    
    private var networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genresCollectionView.delegate = self
        fetchGenres()
    }
    
    private func fetchGenres() {
        networkManager.fetch(Genre.self, from: Link.genresURL.url) { result in
            switch result {
            case .success(let genres):
                print(genres)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension GenresViewController: UICollectionViewDelegate {
    
}


