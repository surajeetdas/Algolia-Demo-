//
//  FacetData.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 31/08/22.
//

import Foundation
import AlgoliaSearchClient

class Facets{
    static let facetsSharedInstance = Facets()
    var facetDict : [Attribute:[Facet]]?
    let facetedAttributes : Set<Attribute> = ["size","price_mrp","sport_en"]
    
    enum FacetDisplayLabels:String{
        case size
        case price_mrp
        case sport_en
    }
    
    
    func getFacetDisplayLabel(attribute : String) -> String{
        if attribute == FacetDisplayLabels.price_mrp.rawValue{
            return "Price"
        }
        if attribute == FacetDisplayLabels.sport_en.rawValue{
            return "Sports"
        }
        
        return "Size"
    }
}





