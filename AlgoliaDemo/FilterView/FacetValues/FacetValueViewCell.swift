//
//  FacetValueViewCell.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 31/08/22.
//

import UIKit

class FacetValueViewCell: UITableViewCell {
    
    @IBOutlet weak var facetValueLabel:UILabel!
    @IBOutlet weak var toggleSwitch : UISwitch!
    let filterDataSharedInstance = Filters.filtersSharedInstance

    override func awakeFromNib() {
        super.awakeFromNib()
        filterDataSharedInstance.filterQuery.removeAll()
        self.toggleSwitch.setOn(false, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setData(facetValue : String){
        facetValueLabel.text = facetValue
        for filter in self.filterDataSharedInstance.selectedFiltersList{
            if filter.elementsEqual(facetValue){
                self.toggleSwitch.setOn(true, animated: true)
            }
            else{
                self.toggleSwitch.setOn(false, animated: true)
            }
        }
    }
    
    @IBAction func onSwitchToggled(_ sender : UISwitch){
        if sender.isOn{
            self.filterDataSharedInstance.filterQuery.append(self.facetValueLabel.text!)
            self.filterDataSharedInstance.selectedFiltersList.append(self.facetValueLabel.text!)
        }
        else{
            if let selectedIndex = self.filterDataSharedInstance.filterQuery.firstIndex(of: self.facetValueLabel.text!){
                self.filterDataSharedInstance.filterQuery.remove(at: selectedIndex)
            }
            if let selectedIndex = self.filterDataSharedInstance.selectedFiltersList.firstIndex(of: self.facetValueLabel.text!){
                self.filterDataSharedInstance.selectedFiltersList.remove(at :selectedIndex)
            }
        }
    }
    
}
