//
//  AboutAppTableViewController.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 09.02.2024.
//

import UIKit

final class AboutAppTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    
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
