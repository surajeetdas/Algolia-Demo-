//
//  MainViewTableCell.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 30/08/22.
//

import UIKit
import Kingfisher

class MainViewTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabelValue:UILabel!
    @IBOutlet weak var categoryLabelValue : UILabel!
    @IBOutlet weak var priceLabelValue : UILabel!
    @IBOutlet weak var ratingLabelValue : UILabel!
    @IBOutlet weak var productImageView : UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(responseObject : DecathlonData){
        nameLabelValue.text = responseObject.nameEn
        categoryLabelValue.text = responseObject.categoryEn
        priceLabelValue.text = "\(responseObject.priceLabel) \(responseObject.priceMrp)"
        ratingLabelValue.text = String(responseObject.rating)
        productImageView.kf.setImage(with: URL(string: responseObject.imageLinkHomeEn))
    }
    
}
