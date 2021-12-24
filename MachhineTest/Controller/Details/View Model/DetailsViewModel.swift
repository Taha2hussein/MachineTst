//
//  DetailsViewModel.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import Foundation
import RxCocoa
import RxSwift

class DetailsViewModel {
    
    private weak var view:DetailsViewController?
 
    var router: DetailedRouter?
    var showData = BehaviorRelay<ShowElement>(value:ShowElement())

    func bind(view:DetailsViewController, router:DetailedRouter){
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    deinit{
        print("Details Deallocated")
    }
}
