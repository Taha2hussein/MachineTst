//
//  ShowTableViewCell.swift
//  MachhineTest
//
//  Created by A on 24/12/2021.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var featureRate: StarRatingView!
    @IBOutlet weak var feaatureImage: UIImageView!
    @IBOutlet weak var featurePremit: UILabel!
    @IBOutlet weak var featureRunTime: UILabel!
    @IBOutlet weak var featureLink: UILabel!
    @IBOutlet weak var featureName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}


extension ShowTableViewCell : configureCell{
        func configure(model:ShowElement ){
            print(model)
            self.featureName.text = model.show?.name
            self.featureLink.text = model.show?.links?.previousepisode?.href
            self.featureRunTime.text = "\(model.show?.runtime ?? 0)"
            self.featurePremit.text = model.show?.premiered
            self.featureRate.rating = model.show?.rating?.average ?? 1.0
            self.loadImages(image: model.show?.image?.original ?? "")
        }
}

extension ShowTableViewCell{
        func loadImages(image:String){
    
            if let url = URL(string:image){
                feaatureImage.load(url: url)
               }
    
        }
}
