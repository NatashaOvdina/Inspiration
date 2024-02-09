//
//  AboutAppTableViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 09.02.2024.
//

import UIKit

final class AboutAppTableViewController: UITableViewController {

    @IBOutlet var imageDeveloper: UIImageView!
    @IBOutlet var gitHubLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var infoLabel: UILabel!
    
    
    private let developerInfo = DataStore.shared.developer
    private let informationApp = DataStore.shared.appInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDeveloperCell()
        setInformationCell()

    }
    
    // MARK: - IB Actions
    
    @IBAction func buttonActionBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setDeveloperCell() {
        imageDeveloper.image = UIImage(named: developerInfo.photoURL)
        imageDeveloper.layer.cornerRadius = imageDeveloper.frame.width / 2
        emailLabel.text = developerInfo.email
        gitHubLabel.text = developerInfo.githubURL
        nameLabel.text = developerInfo.fullName
    }

    private func setInformationCell() {
        infoLabel.text = informationApp.info
    }
}

// MARK: - UITableViewDelegate
extension AboutAppTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let contentView = UIView()
        let label = UILabel()
        
        label.text = switch section {
        case 0:
            "Developer"
        case 1:
            "Information"
        default:
            "How to use"
        }
        
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 10, y: -17, width: tableView.frame.width - 32, height:  30)
        
        label.textColor = .systemGray2
        contentView.addSubview(label)
        return contentView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
}
