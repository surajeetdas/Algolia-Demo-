//
//  SortViewController.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 06/09/22.
//

import UIKit

class SortViewController: UIViewController {
    
    @IBOutlet weak var sortByPriceAscending : UISwitch!
    @IBOutlet weak var sortByPriceDescending : UISwitch!
    @IBOutlet weak var sortByRatingSwitch : UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        sortByPriceAscending.setOn(false, animated: true)
        sortByPriceDescending.setOn(false, animated: true)
        sortByRatingSwitch.setOn(false, animated: true)
    }
    
    @IBAction func onClickApplyButton(_ sender : UIButton){
        if sortByPriceDescending.isOn{
            ClientConfig.indexSwitchOption = IndexOptions.priceDescendingIndex
        }
        if sortByPriceAscending.isOn{
            ClientConfig.indexSwitchOption = IndexOptions.priceAscendingIndex
        }
        if sortByRatingSwitch.isOn{
            ClientConfig.indexSwitchOption = IndexOptions.ratingDescendingIndex
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickResetButton(_ sender : UIButton){
        ClientConfig.indexSwitchOption = IndexOptions.defaultIndex
    }
    
    @IBAction func onClickSortByPriceAscendingSwitch(_ sender :UISwitch){
        if sender.isOn{
            self.sortByPriceDescending.setOn(false, animated: true)
            self.sortByRatingSwitch.setOn(false, animated: true)
        }
    }
    
    @IBAction func onClickSortByPriceDescendingSwitch(_ sender : UISwitch){
        if sender.isOn{
            self.sortByPriceAscending.setOn(false, animated: true)
            self.sortByRatingSwitch.setOn(false, animated: true)
        }
    }
    
    @IBAction func onClickSortByRatingSwitch(_ sender : UISwitch){
        if sender.isOn{
            self.sortByPriceAscending.setOn(false, animated: true)
            self.sortByPriceDescending.setOn(false, animated: true)
        }
    }

}
