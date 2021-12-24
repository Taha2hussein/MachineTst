//
//  DetailsViewController.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import UIKit
import RxCocoa
import RxSwift

class DetailsViewController: BaseViewController {

    @IBOutlet weak var detailedImaigeView: UIImageView!
    @IBOutlet weak var premitedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    //Mark : Instance
    var DetailedViewModelInstance = DetailsViewModel()
    private var router = DetailedRouter()
    
    // Mark:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewControllerRouter()
        bindName()
        bindPremited()
        bindImage()
    }
    
    func bindName(){
        self.DetailedViewModelInstance.showData.subscribe {[weak self] element in
            self?.nameLabel.text = element.element?.show?.name
        } .disposed(by: self.disposeBag)

    }
    
    func bindPremited(){
        self.DetailedViewModelInstance.showData.subscribe {[weak self] element in
            self?.premitedLabel.text = element.element?.show?.premiered
        } .disposed(by: self.disposeBag)
    }
    
    func bindImage(){
        self.DetailedViewModelInstance.showData.subscribe {[weak self] element in
            self?.setImage(image: element.element?.show?.image?.medium ?? "")
        } .disposed(by: self.disposeBag)
    }
    
    func bindViewControllerRouter(){
        DetailedViewModelInstance.bind(view: self, router: router)
    }
    
    func setImage(image:String) {
        if let url = URL(string:image){
            detailedImaigeView.load(url: url)
           }
    }
}

