//
//  YPCellBindable.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/23.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation

protocol YPCellBindable {
    associatedtype Data
    func bind(_ data: Data)
}

extension YPCellBindable {
    func bind(_ data: YPCellNoneData) {}
}

struct YPCellNoneData {}
