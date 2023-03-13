//
//  MainTableViewCell.swift
//
//
//  
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    var title = "?" {
        didSet {
            titleLabel.text = title
        }
    }
    func setTitle(title: String) {
        
        titleLabel.text = title
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor  = .black
        titleLabel.font = .systemFont(ofSize: 30)
        selectionStyle = .none
    }

    
    
}
