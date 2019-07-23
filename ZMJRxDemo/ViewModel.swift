//
//  ViewModel.swift
//  ZMJRxDemo
//
//  Created by ZMJ on 2019/7/5.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct ViewModel: ViewModelProtocol {
    let input: Input
    let output: Output
    
    struct Input {
        let triger: AnyObserver<Void>
    }
    
    struct Output {
        let trigerResultDriver: Driver<String>
        let error: Observable<Error>
    }
    
    public init() {
        
        let trigerSubject = PublishSubject<Void>()
        let errorSubject = PublishSubject<Error>()
        let resultSubject = PublishSubject<String>()

        let bag = DisposeBag()
        
         trigerSubject.startWith().subscribe(onNext: { (_) in
            
            NetworkService.fetchHomePageData().subscribe(onNext: { (element) in
                
                print("onNext:\(String(describing: element))" )
                
                switch element {
                case .success(let str) :
                    resultSubject.onNext(str)

                case .fail(let error):
                    errorSubject.onNext(error)
                }
                
                
            }, onError: { (error) in
                
                print("onError")
                
            }, onCompleted: {
                
                print("onCompleted")
                
            }, onDisposed: {
                print("onDisposed")
            }).disposed(by: bag)
            
        }).disposed(by: bag)
        
        self.input = Input(triger: trigerSubject.asObserver())
        
        self.output = Output(trigerResultDriver: resultSubject.asDriver(onErrorJustReturn: "onErrorJustReturn"),
                             error: errorSubject.asObservable())
    }
}
