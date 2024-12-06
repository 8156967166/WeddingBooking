////
////  DataJsonModel.swift
////  WeddingBooking
////
////  Created by Aneesha on 13/05/24.
////
//
//import Foundation
//
//struct JsonData: Codable {
//    let status: Int
//    let message: String
//    let data: CategoryData
//}
//
//struct CategoryData: Codable {
//    let category1: [Category1]
//    
//    enum CodingKeys: String, CodingKey {
//        case category1 = "Category1"
//    }
//}
//
//struct Category1: Codable {
//    let id: Int
//    let categoryName: String
//    let decorationsAndAmbiance: [DecorationAndAmbiance]
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case categoryName = "CategoryName"
//        case decorationsAndAmbiance
//    }
//}
//
//struct DecorationAndAmbiance: Codable {
//    let id: Int
//    let name: String
//    let price: String
//    let offerings: [String]
//    let policies: [String]
//    let about: String
//    let image: String
//    let rating: Double
//    let imageAlbum: [String]
//}
