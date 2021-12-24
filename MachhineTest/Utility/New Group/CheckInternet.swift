//
//  CheckInternet.swift
//  RxSwiftTraining
//
//  Created by A on 14/12/2021.
//

import UIKit
import RxReachability
import RxCocoa
import RxSwift
import Reachability
class checkInternetViewController: UIViewController {
    
   let reachability: Reachability! = try? Reachability()
   var alertError = Alert()
   var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        //      reachability.rx.isReachable
        //          .map { "Is reachable: \($0)" }
        ////          .bind(to: label.rx.text)
        //          .disposed(by: disposeBag)
        
        bindReachability()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        try? reachability?.startNotifier()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability?.stopNotifier()
    }
}

extension checkInternetViewController {
    
    
    func bindReachability() {
        
        reachability?.rx.reachabilityChanged
            .subscribe(onNext: { Reachability in
          
            })
            .disposed(by: disposeBag)
        
        reachability?.rx.status
            .subscribe(onNext: { Reachability in
            })
            .disposed(by: disposeBag)
        
        reachability?.rx.isReachable
            .subscribe(onNext: { isReachable in
                print("isReachable",isReachable)
                if isReachable == false {
                    self.alertError.displayError(text: "No network found...", viewController: self)
                }
            })
            .disposed(by: disposeBag)
        
        reachability?.rx.isConnected
            .subscribe(onNext: {
            })
            .disposed(by: disposeBag)
        
        reachability?.rx.isDisconnected
            .subscribe(onNext: {
            })
            .disposed(by: disposeBag)
    }
}



