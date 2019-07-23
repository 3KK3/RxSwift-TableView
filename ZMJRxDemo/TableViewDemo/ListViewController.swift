//
//  ListViewController.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/23.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit

class ListViewController: YPBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        var tempArray = [YPCellConvertibleType]()
        
        for index in 0...20 {
            let model = ListModel(text: String(index), imgName: nil)
            let cellItem = YPCellItem<ListTableViewCell>(data: model)
            tempArray.append(cellItem)
            tableView.register(UINib(nibName: cellItem.reuseIdentifier, bundle: nil), forCellReuseIdentifier: cellItem.reuseIdentifier)
        }
        
        selectCellHandler = {(itemData, indexPath) in
            print(itemData.cellData())
            print(indexPath)
        }
        
        let section = YPSectionItem(header: "", cellItems: tempArray)
        let section1 = YPSectionItem(header: "", cellItems: tempArray)

        dataArray.append(section)
        dataArray.append(section1)

        tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height:  view.frame.size.width)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}
