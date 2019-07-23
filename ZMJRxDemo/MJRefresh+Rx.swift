//
//  MJRefresh+Rx.swift
//  YPFinance
//
//  Created by ZMJ on 2019/7/5.
//  Copyright © 2019 YeePBank. All rights reserved.
//

import Foundation
import MJRefresh
import RxSwift
import RxCocoa

extension Reactive where Base: MJRefreshComponent {
    
    var refreshing: ControlEvent<Void> {
        let source: Observable<Void> = Observable.create { [weak control = self.base] (observer) -> Disposable in
        
            if let control = control {
                control.refreshingBlock = {
                    observer.onNext(())
                }
            }
            return Disposables.create()
        }
        return ControlEvent(events: source)
    }
    
    var endRefreshing: Binder<Bool> {
        return Binder(base) {refresh, isEnd in
            if isEnd {
                refresh.endRefreshing()
            }
        }
    }
}

