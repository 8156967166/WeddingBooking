//
//  EventModel.swift
//  WeddingBooking
//
//  Created by Aneesha on 17/05/24.
//


import Foundation

class Event: Codable {
    let id: Int
    let name: String
    let price: String
    let offerings: [String]
    let policies: [String]
    let about: String
    let image: String
    let rating: Double
    let link: String
    let imageAlbum: [String]
    
    
    init(id: Int, name: String, price: String, offerings: [String], policies: [String], about: String, image: String, rating: Double, link: String, imageAlbum: [String]) {
        self.id = id
        self.name = name
        self.price = price
        self.offerings = offerings
        self.policies = policies
        self.about = about
        self.image = image
        self.rating = rating
        self.link = link
        self.imageAlbum = imageAlbum
    }
}

class Categories: Codable {
    let categoryName: String
    let events: [Event]
    let img: String
    
    init(categoryName: String, events: [Event], imgStrg: String) {
        self.categoryName = categoryName
        self.events = events
        self.img = imgStrg
    }
}
