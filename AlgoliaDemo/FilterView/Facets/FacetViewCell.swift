//
//  FacetViewCellTableViewCell.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 31/08/22.
//

import UIKit
import AlgoliaSearchClient

class FacetViewCell: UITableViewCell {
    
    let filterSharedInstance = Filters.filtersSharedInstance
    
    @IBOutlet weak var facet:UILabel!
    @IBOutlet weak var filterImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(attribute : String){
        facet.text = attribute
    }
    
}
