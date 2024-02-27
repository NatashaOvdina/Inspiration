//
//  GenresCollectionViewCell.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 03.02.2024.
//

import UIKit

final class GenresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var genreLabelCell: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with genre: String?) {
        guard let genre else { return }
        genreLabelCell.text = genre
    }
}
