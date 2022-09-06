//
//  DecathlonDataModel.swift
//  AlgoliaDemo
//
//  Created by Vantage Circle on 30/08/22.
//

import Foundation


struct DecathlonData: Codable {
    let dsm: String
    let modelID: Int
    let familyID, sportID, categoryEn: String
    let categoriesEn, categoryID: [String]
    let parentID, categorySlugEn, levelDepth: String
    let imageLinkHomeEn, imageLinkSmallEn: String
    let linkEn, manufacturerEn, nameEn, reference: String
    let idSticker, lifeCycle: Int
    let stickertype: String
    let stickerImage: String
    let tagsEn: [String]
    let margin: Double
    let gaProductListViews, gaProductDetailViews, gaProductAddsToCart, gaProductCheckouts: Int
    let gaUniquePurchases: Int
    let gaCartToDetailRate, gaBuyToDetailRate: Double
    let gaItemRevenue, gaItemQuantity, gaProductRefundAmount: Int
    let rating, calculatedMetric: Double
    let sportEn, sportPraticeEn, natureIDEn: String
    let natureIDArrayEn: [String]
    let genderIDEn, itemCode, size: String
    let price, priceNodiscount, priceMrp, discountPercentage: Int
    let priceLabel: String
    let slashedPrice: Int
    let showSlash: Bool
    let variations: Variations

    enum CodingKeys: String, CodingKey {
        case dsm
        case modelID = "model_id"
        case familyID = "familyId"
        case sportID = "sportId"
        case categoryEn = "category_en"
        case categoriesEn = "categories_en"
        case categoryID = "category_id"
        case parentID = "parent_id"
        case categorySlugEn = "category_slug_en"
        case levelDepth = "level_depth"
        case imageLinkHomeEn = "image_link_home_en"
        case imageLinkSmallEn = "image_link_small_en"
        case linkEn = "link_en"
        case manufacturerEn = "manufacturer_en"
        case nameEn = "name_en"
        case reference
        case idSticker = "id_sticker"
        case lifeCycle = "life_cycle"
        case stickertype, stickerImage
        case tagsEn = "tags_en"
        case margin
        case gaProductListViews = "ga_productListViews"
        case gaProductDetailViews = "ga_productDetailViews"
        case gaProductAddsToCart = "ga_productAddsToCart"
        case gaProductCheckouts = "ga_productCheckouts"
        case gaUniquePurchases = "ga_uniquePurchases"
        case gaCartToDetailRate = "ga_cartToDetailRate"
        case gaBuyToDetailRate = "ga_buyToDetailRate"
        case gaItemRevenue = "ga_itemRevenue"
        case gaItemQuantity = "ga_itemQuantity"
        case gaProductRefundAmount = "ga_productRefundAmount"
        case rating
        case calculatedMetric = "calculated_metric"
        case sportEn = "sport_en"
        case sportPraticeEn = "sport_pratice_en"
        case natureIDEn = "nature_id_en"
        case natureIDArrayEn = "nature_id_array_en"
        case genderIDEn = "gender_id_en"
        case itemCode = "item_code"
        case size, price
        case priceNodiscount = "price_nodiscount"
        case priceMrp = "price_mrp"
        case discountPercentage, priceLabel, slashedPrice, showSlash, variations
    }
}


struct Variations: Codable {
    let dsmID: String
    let modelArr: [ModelArr]
}


struct ModelArr: Codable {
    let modelID: Int
    let itemArr: [ItemArr]
    let modelDetails: ModelDetails
}


struct ItemArr: Codable {
    let itemID: String
    let item: Item
}


struct Item: Codable {
    let size: String
}


struct ModelDetails: Codable {
    let imageLinkHomeEn, imageLinkSmallEn: String
    let linkEn, categorySlugEn, nameEn: String
    let rating: Double
    let price, priceNodiscount, priceMrp, discountPercentage: Int
    let priceLabel: String
    let slashedPrice: Int
    let familyID, sportID, businessColor, stickertype: String
    let stickerImage: String
    let showSlash: Bool

    enum CodingKeys: String, CodingKey {
        case imageLinkHomeEn = "image_link_home_en"
        case imageLinkSmallEn = "image_link_small_en"
        case linkEn = "link_en"
        case categorySlugEn = "category_slug_en"
        case nameEn = "name_en"
        case rating, price
        case priceNodiscount = "price_nodiscount"
        case priceMrp = "price_mrp"
        case discountPercentage, priceLabel, slashedPrice
        case familyID = "familyId"
        case sportID = "sportId"
        case businessColor = "business_color"
        case stickertype, stickerImage, showSlash
    }
    
}

