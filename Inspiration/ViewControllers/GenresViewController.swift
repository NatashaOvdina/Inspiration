//
//  GenresViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 03.02.2024.
//

import UIKit

final class GenresViewController: UIViewController {
    
    @IBOutlet var genresCollectionView: UICollectionView!
    
    private var networkManager = NetworkManager.shared
    private var genresList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //   self.genresCollectionView.delegate = self
       genresCollectionView.dataSource = self
       
    }
    

    }

    extension GenresViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            genresList.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath)
            guard let cell = cell as? GenresCollectionViewCell else { return UICollectionViewCell() }
            cell.genreLabelCell.text = genresList[indexPath.item]
            
            return cell
        }
        
    }


