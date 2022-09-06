//
//  FilterData.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 31/08/22.
//

import Foundation

class Filters{
    static let filtersSharedInstance = Filters()
    var filterQuery = [String]()
    var selectedFiltersList = [String]()
    var filterQueryString = ""
    
    func createFilterQuery(facetAttribute : String){
        var tempFilterQueryString = ""
        tempFilterQueryString.append(FilterQueryConcatenators.leftParenthesis.rawValue)
        for (index,filterItem) in filterQuery.enumerated(){
            tempFilterQueryString.append(facetAttribute+":"+filterItem)
            if index != filterQuery.count - 1{
                tempFilterQueryString.append(" "+FilterQueryConcatenators.OR.rawValue+" ")
            }
        }
        tempFilterQueryString.append(FilterQueryConcatenators.rightParenthesis.rawValue)
        guard filterQueryString.isEmpty else {
            filterQueryString.append(" "+FilterQueryConcatenators.AND.rawValue+" ")
            filterQueryString.append(tempFilterQueryString)
            return
        }
        filterQueryString = tempFilterQueryString
    }
    
    func clearAllFilters(){
        self.filterQuery.removeAll()
        self.selectedFiltersList.removeAll()
        self.filterQueryString = ""
    }
}

enum FilterQueryConcatenators:String{
    case OR,AND,NOT
    case leftParenthesis = "("
    case rightParenthesis = ")"
}
