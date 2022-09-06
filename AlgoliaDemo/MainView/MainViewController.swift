//
//  MainViewController.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 29/08/22.
//

import UIKit
import AlgoliaSearchClient

class MainViewController: UIViewController {
    
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var homeTableView : UITableView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    
    var responseData : [DecathlonData] = []
    var facetDict : [Attribute:[Facet]] = [:]
    lazy var dataRepository = DataRepository()
    lazy var facetSharedInstance = Facets.facetsSharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.startAnimating()
        self.registerTableViewCell()
        homeTableView.dataSource = self
        homeTableView.delegate = self
        self.renderView("")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.renderView("")
    }
    
    private func renderView(_ queryString:String){
        dataRepository.makeQuery(query: queryString) { result, facets ,error in
            if error == nil{
                self.responseData = result!
                self.facetDict = facets!
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.homeTableView.reloadData()
                }
            }
        }
    }
    
    private func registerTableViewCell(){
        let homeViewCell = UINib(nibName: "MainViewTableCell", bundle: nil)
        self.homeTableView.register(homeViewCell, forCellReuseIdentifier: "MainViewTableCell")
    }

    @IBAction func onClickFilterBtn(_ sender: Any) {
        facetSharedInstance.facetDict = self.facetDict
        self.navigationController?.pushViewController(FilterViewController(), animated: true)
    }
    
    @IBAction func onClickSortButton(_ sender : UIButton){
        self.navigationController?.pushViewController(SortViewController(), animated: true)
    }
}

extension MainViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(370)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeViewCell = tableView.dequeueReusableCell(withIdentifier: "MainViewTableCell", for: indexPath) as? MainViewTableCell
        let currentAlgoliaResponseObject = responseData[indexPath.row]
        homeViewCell?.setData(responseObject: currentAlgoliaResponseObject)
        return homeViewCell ?? UITableViewCell()
    }
    
    
}

extension MainViewController : UISearchBarDelegate,UISearchDisplayDelegate{

//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        self.present(SearchViewController(), animated: true)
//        return true
//    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.renderView(searchText)
    }
}
