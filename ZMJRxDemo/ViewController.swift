//
//  ViewController.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/5.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import MJRefresh

class ViewController: UIViewController {
    
    let bag = DisposeBag()
    private var tableView: UITableView!

    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        sutupUI()
    }

    func sutupUI() {
            
        let frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        tableView = UITableView(frame: frame, style: .plain)
        tableView.backgroundColor = UIColor.lightGray
        self.view.addSubview(tableView)

        tableView.mj_header = MJRefreshNormalHeader()
        
        tableView.mj_header.rx.refreshing.bind(to:viewModel.input.triger).disposed(by: bag)
        
        viewModel.output.trigerResultDriver.asObservable().subscribe { [weak self] (e) in
            
            self?.tableView.mj_header.endRefreshing()
            print("end refreshing \(e)")
            
            }.disposed(by: bag)
        
        viewModel.output.error.subscribe(onNext: {  [weak self](error) in
            print("error \(error.localizedDescription)")
            self?.tableView.mj_header.endRefreshing()

        }).disposed(by: bag)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(ListViewController(.plain), animated: true, completion: nil)
    }


}

