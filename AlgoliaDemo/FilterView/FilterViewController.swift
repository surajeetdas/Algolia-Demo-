//
//  FilterViewController.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 02/09/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var facetTableView:UITableView!
    let faceDataSharedInstance  = Facets.facetsSharedInstance
    let filterSharedInstance = Filters.filtersSharedInstance
    var facetDictKeys = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        facetTableView.delegate = self
        facetTableView.dataSource = self
        
        for attributeKey in self.faceDataSharedInstance.facetDict!.keys{
            facetDictKeys.append(attributeKey.rawValue)
        }
    }
    
    func registerTableViewCells(){
        self.facetTableView.register(UINib(nibName: "FacetViewCell", bundle: nil), forCellReuseIdentifier: "FacetViewCell")
    }
    
    @IBAction func onCancelBtnClicked(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClearBtnClicked(_ sender : UIButton){
        filterSharedInstance.clearAllFilters()
    }

}

extension FilterViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.faceDataSharedInstance.facetDict?.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let facetViewCell = tableView.dequeueReusableCell(withIdentifier: "FacetViewCell", for: indexPath) as? FacetViewCell
        let currentFacet = self.facetDictKeys[indexPath.row]
        facetViewCell?.setData(attribute: self.faceDataSharedInstance.getFacetDisplayLabel(attribute: currentFacet))
        return facetViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let facetValueViewController = FacetValueViewController()
        facetValueViewController.setFacetKey(facetKey: self.facetDictKeys[indexPath.row])
        self.present(facetValueViewController, animated: true)
    }
    
    
}
