//
//  DetailedRouter.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//


import UIKit

class DetailedRouter{
    var viewController: UIViewController{
        return createViewController()
    }
    
    private var DetailedViewModels = DetailsViewModel()
    private var sourceView:UIViewController?
    var showData : ShowElement?
    
    private func createViewController()-> UIViewController {
        let view = UIStoryboard.init(name: Storyboards.Details.rawValue, bundle: nil).instantiateViewController(withIdentifier: viewControllers.Detailed.rawValue)as! DetailsViewController
        view.DetailedViewModelInstance.showData.accept(showData!)
        return view
    }
    
    init(){
        
    }
    
    init(showData: ShowElement){
        self.showData = showData
    }

    
    func setSourceView(_ sourceView:UIViewController?){
        guard let view = sourceView else {fatalError("Error Desconocido")}
        self.sourceView = view
    }

}
