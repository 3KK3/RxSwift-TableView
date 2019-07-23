//
//  YPCellConvertibleType.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/23.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit

protocol YPCellConvertibleType {
    
    var tag: YPCellTag { get }
    var reuseIdentifier: String { get }
    var cellClass: AnyClass { get }
    
    func update(cell: UITableViewCell)
    func cell<C: UITableViewCell>() -> C
    func cellData<D>() -> D
}
