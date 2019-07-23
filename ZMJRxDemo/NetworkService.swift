//
//  NetworkService.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/5.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation


import Foundation
import RxCocoa
import RxSwift

struct MyError: Error {
    
    var localizedDescription: String {
        
        return "这是一个错误"
    }
}

enum NetworkResult<T> {
    case success(T)
    case fail(MyError)
}

class NetworkService {
    
    // 请求首页数据
    static func fetchHomePageData() -> Observable<NetworkResult<String>> {
        
        let single = Observable<NetworkResult<String>>.create { (observer) -> Disposable in
            
            // TODO: 进行网络请求 成功 observer(.success(数据))， 失败observer(.error(error))
            let arc = arc4random() % 2
            if arc > 0 {
                let result = NetworkResult<String>.success("📚🌞")
                observer.onNext(result)
            } else {
                let result = NetworkResult<String>.fail(MyError())
                observer.onNext(result)
            }
            return Disposables.create()
        }
        return single
    }
}
