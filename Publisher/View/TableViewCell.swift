//
//  TableViewCell.swift
//  Publisher
//
//  Created by Eric chung on 2022/4/2.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autorNameLabel: UILabel!
    @IBOutlet weak var createdTimeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryBackGroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCellItem()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configCellItem () {
        titleLabel.font = UIFont(name: "PingFangTC-Bold", size: 18)
        titleLabel.textColor = .black
        autorNameLabel.font = UIFont(name: "PingFangTC-Regular", size: 14)
        autorNameLabel.textColor = .darkGray
        createdTimeLabel.font = UIFont(name: "PingFangTC-Regular", size: 14)
        createdTimeLabel.textColor = .black
        contentLabel.font = UIFont(name: "PingFangTC-Regular", size: 14)
        contentLabel.textColor = .black
        categoryLabel.layer.masksToBounds = true
        categoryLabel.font = UIFont(name: "Arial", size: 14)
        categoryBackGroundView.layer.cornerRadius = 5
        
    }
    
    
}
