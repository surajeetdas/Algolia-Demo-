//
//  FacetValueViewController.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 01/09/22.
//

import UIKit
import AlgoliaSearchClient

class FacetValueViewController: UIViewController {
    
    @IBOutlet weak var facetLabel:UILabel!
    @IBOutlet weak var facetValuesTableView:UITableView!
    
    let facetDataSharedInstance  = Facets.facetsSharedInstance
    let filterDataSharedInstance = Filters.filtersSharedInstance
    var facetKey : String = ""
    var facetValues = [Facet]()
    
    
    func setFacetKey(facetKey : String){
        self.facetKey = facetKey
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        facetLabel.text = self.facetDataSharedInstance.getFacetDisplayLabel(attribute: self.facetKey)
        self.facetValues = self.facetDataSharedInstance.facetDict![Attribute(rawValue: self.facetKey)]!
        registerTableViewCells()
        facetValuesTableView.delegate = self
        facetValuesTableView.dataSource = self
    }
    
    func registerTableViewCells(){
        self.facetValuesTableView.register(UINib(nibName: "FacetValueViewCell", bundle: nil), forCellReuseIdentifier: "FacetValueViewCell")
    }
    
    @IBAction func cancelBtnClicked(_ sender : UIButton){
        self.dismiss(animated: true)
    }
    
    @IBAction func applyFiltersBtnClicked(_ sender : UIButton){
        filterDataSharedInstance.createFilterQuery(facetAttribute: self.facetKey)
        self.dismiss(animated: true)
    }

}

extension FacetValueViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.facetValues.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let facetValueViewCell = tableView.dequeueReusableCell(withIdentifier: "FacetValueViewCell", for: indexPath) as? FacetValueViewCell
        facetValueViewCell?.setData(facetValue: self.facetValues[indexPath.row].value)
        return facetValueViewCell ?? UITableViewCell()
    }
    
}
