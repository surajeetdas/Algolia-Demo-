//
//  ClientConfig.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 30/08/22.
//

import Foundation
import AlgoliaSearchClient

struct ClientConfig{
    private init(){}
    
    static let searchClient = SearchClient(appID: ConfigConstants.appID, apiKey: ConfigConstants.searchApiKey)
    static let defaultSearchIndex = searchClient.index(withName: ConfigConstants.indexName)
    static let adminClient = SearchClient(appID: ConfigConstants.appID, apiKey: ConfigConstants.adminApiKey)
    static let adminIndex = adminClient.index(withName: ConfigConstants.indexName)
    static let priceAscendingIndex = searchClient.index(withName: ConfigConstants.priceAscendingIndexName)
    static let priceDescendingIndex = searchClient.index(withName: ConfigConstants.priceDescendingIndexName)
    static let ratingDescendingIndex = searchClient.index(withName: ConfigConstants.ratingDescendingIndexName)
    static var effectiveSearchIndex = defaultSearchIndex
    static let settings = Settings()
    
    static var indexSwitchOption : IndexOptions = IndexOptions.defaultIndex{
        didSet{
            switch indexSwitchOption{
            case .priceAscendingIndex:
                effectiveSearchIndex = priceAscendingIndex
            case .priceDescendingIndex:
                effectiveSearchIndex = priceDescendingIndex
            case .ratingDescendingIndex:
                effectiveSearchIndex = ratingDescendingIndex
            case .defaultIndex:
                effectiveSearchIndex = defaultSearchIndex
            }
        }
    }
}
