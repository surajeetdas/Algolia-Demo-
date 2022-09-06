//
//  DataRepository.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 30/08/22.
//

import Foundation
import AlgoliaSearchClient

class DataRepository{
    let filterSharedInstance = Filters.filtersSharedInstance
    let facetSharedInstance = Facets.facetsSharedInstance
    
    private func getQueryInstance(_ queryStr : String) -> Query{
        return Query(queryStr).set(\.facets, to: facetSharedInstance.facetedAttributes).set(\.filters, to: filterSharedInstance.filterQueryString)
    }
    
    func makeQuery(query : String ,responseCallback : @escaping ([DecathlonData]?,[Attribute:[Facet]]?,Error?) -> Void){
        ClientConfig.effectiveSearchIndex.search(query: self.getQueryInstance(query)) { result in
            switch result{
            case .success(let searchResponse):
                do{
                    let dataResponse : [DecathlonData] = try searchResponse.extractHits()
                    responseCallback(dataResponse,searchResponse.facets,nil)
                }
                catch let err{
                    responseCallback(nil,nil,err)
                }
            case .failure(let error):
                responseCallback(nil,nil,error)
            }
        }
    }
    
}
