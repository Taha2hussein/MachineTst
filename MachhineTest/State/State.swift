//
//  State.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import Foundation
import RxCocoa
import RxSwift

class State{
    var isLoading = BehaviorRelay<Bool>(value:false)
    var isHideTableView = BehaviorRelay<Bool>(value: false)
}
