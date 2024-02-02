//
//  ViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 30.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRandomQuote()
    }
    
    private func fetchRandomQuote() {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let quote = try JSONDecoder().decode(Info.self, from: data)
                print(quote)
            } catch {
                print(error)
            }
        }.resume()
    }
}
