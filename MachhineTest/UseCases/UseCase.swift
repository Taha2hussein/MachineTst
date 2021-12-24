//
//  UseCase.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import UIKit

protocol UseCase {
    func fetchData()
    func bind(view:ShowViewController, router:ShowRouter)
}
protocol configureCell{
    func configure(model:ShowElement )
}
protocol loadImages{
    func loadImages(image:String)
}
protocol pushDetails{
    func pushView(showElment:ShowElement)
}
protocol setValueProtocol{
    func setValueForName()
    func setValueForPremited()
}
