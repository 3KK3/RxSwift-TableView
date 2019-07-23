//
//  YPCellItem.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/23.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit

class YPCellItem<Cell>: YPCellConvertibleType where Cell: YPCellBindable, Cell: UITableViewCell {
    
    let cellClass: AnyClass = Cell.self
    let reuseIdentifier = "\(Cell.classForCoder())"
    let tag: YPCellTag
    
    let data: Cell.Data
    
    private var _cell: Cell?

    init(data: Cell.Data, tag: YPCellTag = YPCellTag.noneTag) {
        self.tag = tag
        self.data = data
    }
    
    func update(cell: UITableViewCell) {
        guard let cell = cell as? Cell else {
            fatalError("cell 类型错误")
        }
        _cell = cell
        cell.bind(data)
    }
    
    func cellData<D>() -> D {
        guard let data = data as? D else {
            fatalError("data 类型错误")
        }
        return data
    }
    
    func cell<C: UITableViewCell>() -> C {
        guard let cell = _cell as? C else {
            fatalError("cell 类型错误")
        }
        return cell
    }
}
