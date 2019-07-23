//
//  ListAnotherCell.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/23.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit

class ListAnotherCell: UITableViewCell {
    
    private lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.red
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .horizontal)
        return contentLabel
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ListAnotherCell: YPCellBindable {
    func bind(_ data: ListModel) {
    }
}
