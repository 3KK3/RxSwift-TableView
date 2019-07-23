//
//  YPBaseTableViewController.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/23.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit

class YPBaseTableViewController: UIViewController {
    
    public var tableView: UITableView!
    private let style: UITableView.Style
    
    public var dataArray: [YPSectionItem] = []
    public var selectCellHandler: ((YPCellConvertibleType, IndexPath)->())?
    
    required init(_ tableViewStyle: UITableView.Style) {
        self.style = tableViewStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView = UITableView(frame: CGRect.zero, style: style)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = UIView()
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension YPBaseTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].cellItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = dataArray[indexPath.section].cellItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseIdentifier, for: indexPath)
        item.update(cell: cell)
        return cell
    }
}

extension YPBaseTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let handler = selectCellHandler else {return}
        let item = dataArray[indexPath.section].cellItems[indexPath.row]
        handler(item, indexPath)
    }

}


