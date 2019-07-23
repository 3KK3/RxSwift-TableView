//
//  ViewModelProtocol.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/5.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
