//
//  ConfigConstants.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 30/08/22.
//

import Foundation
import AlgoliaSearchClient

struct ConfigConstants{
    private init(){}
    static let appID = ApplicationID("H2ORCSHKGS")
    static let searchApiKey = APIKey("cdd1598cbef1887ec868d1923a1d2e5d")
    static let adminApiKey = APIKey("c26da98c452c2d682a2df481790bdc1a")
    static let indexName = IndexName("Decathlon JSON")
    static let priceAscendingIndexName = IndexName("Price Ascending Index")
    static let priceDescendingIndexName = IndexName("Price Descending Index")
    static let ratingDescendingIndexName = IndexName("Rating Descending Index")
}


enum IndexOptions{
    case priceAscendingIndex,priceDescendingIndex,ratingDescendingIndex,defaultIndex
}
