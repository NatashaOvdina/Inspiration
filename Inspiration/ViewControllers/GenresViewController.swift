//
//  GenresViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 03.02.2024.
//

import UIKit
import Alamofire

final class GenresViewController: UIViewController {
    
    @IBOutlet var genresCollectionView: UICollectionView!
    
    private var networkManager = NetworkManager.shared
    private var genresList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //   self.genresCollectionView.delegate = self
       genresCollectionView.dataSource = self
    fetchGenres()
       
    }
    private func fetchGenres() {
        AF.request(Link.genresURL.url)
            .validate()
            .responseJSON { [unowned self] dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let genres = value as? [[String: Any]] else { return }
                        
                    
                 
                    for genre in genres {
                        let oneGenre = Genre(data: genre["data"] as? [String] ?? [])
                    }
                    
                    genresList.append(oneGenre)
                    
                    genresCollectionView.reloadData()
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    }

    extension GenresViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            genresList.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath)
            guard let cell = cell as? GenresCollectionViewCell else { return UICollectionViewCell() }
            fetchGenres()
            cell.genreLabelCell.text = genresList[indexPath.item]
            
            return cell
        }
        
    }


