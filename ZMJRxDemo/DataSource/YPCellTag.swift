//
//  YPCellTag.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/23.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation

public class YPCellTag {
    
    public let _key: String
    
    public init(_ key: String) {
        self._key = key
    }
}

extension YPCellTag: Hashable {
    public static func ==(lhs: YPCellTag, rhs: YPCellTag) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_key)
    }
}

extension YPCellTag {
    static let noneTag = YPCellTag("")
}


