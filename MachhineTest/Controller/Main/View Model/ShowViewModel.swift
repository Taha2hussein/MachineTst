//
//  ShowViewModel.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import Foundation
import RxCocoa
import RxSwift

class ShowViewModel : UseCase{
    
    private weak var view:ShowViewController?
    private var router: ShowRouter?
    var state = State()
    private var featuesObject = PublishSubject<Show>()
    var featuesObjectObservable : PublishSubject<Show> {
        return featuesObject
    }
    
    func bind(view:ShowViewController, router:ShowRouter){
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func fetchData() {
        
        state.isLoading.accept(true)
        print(Future)
        NetWorkManager.instance.API(method: .get, url: Future) { [weak self](err, status, response:Show?) in
            guard let self = self else { return }
            self.state.isLoading.accept(false)
            if let error = err {
                print(error.localizedDescription)
            }  else {
                
                guard let featuesModel  = response else { return }
                if featuesModel.count > 0 {
                    self.featuesObject.onNext(response ?? [])
                    self.state.isHideTableView.accept(false)
                } else {
                    self.state.isHideTableView.accept(true)
                }
            }
        }
    }
    
    
    deinit{
        print("Main Deallocated")
    }
}


extension ShowViewModel : pushDetails {
    func pushView(showElment: ShowElement) {
        router?.navigateTodetailView(showEkemnt: showElment)

    }
    
    
}
