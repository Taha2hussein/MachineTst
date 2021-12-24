//
//  ShowViewController.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import UIKit
import RxCocoa
import RxRelay
import RxSwift
class ShowViewController: BaseViewController {
    
    
    
    //Mark : Outlets
    @IBOutlet weak var showTableView: UITableView!
    
    //Mark : Instance
    private var ShowViewModelInstance = ShowViewModel()
    private var router = ShowRouter()
    
    //Mark: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToLoader()
        fetchData()
        bindDataToTableView()
        selectItems()
        bindViewControllerRouter()
    }
    
    func subscribeToLoader(){
        ShowViewModelInstance.state.isLoading.subscribe(onNext: {[weak self] (isLoading) in
            if isLoading {
                self?.showLoading()
                
            } else {
                self?.HideLoading()
            }
        }).disposed(by: self.disposeBag)
    }
    
    func selectItems(){
        Observable.zip(showTableView
                        .rx
                        .itemSelected,showTableView.rx.modelSelected(ShowElement.self)).bind { [weak self] selectedIndex, product in
            self?.showTableView.deselectRow(at: selectedIndex, animated: true)
            self?.ShowViewModelInstance.pushView(showElment: product)
        }
            .disposed(by: self.disposeBag)
    }
    
    func bindViewControllerRouter(){
        ShowViewModelInstance.bind(view: self, router: router)
    }
    
    func bindDataToTableView(){
        self.ShowViewModelInstance.featuesObjectObservable
            .bind(to: self.showTableView
                    .rx
                    .items(cellIdentifier: String(describing:  ShowTableViewCell.self),
                           cellType: ShowTableViewCell.self)) { row, model, cell in
                
                cell.configure(model: model)
            }.disposed(by: self.disposeBag)
    }
    
    func fetchData(){
        ShowViewModelInstance.fetchData()
    }
    
}
