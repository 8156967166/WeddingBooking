//
//  GooglePlacesManager.swift
//  WeddingBooking
//
//  Created by Aneesha on 17/05/24.
//

import Foundation
import GooglePlaces

struct Places {
    let name: String
    let identifier: String
}

final class GooglePlacesManager {
    static let shared = GooglePlacesManager()
    
    private let client = GMSPlacesClient.shared()
    
    private init() {}
    
    enum PlacesError: Error {
        case failedToFind
    }
    
    public func findPlaces(query: String, completion: @escaping (Result<[Places], Error>) -> Void) {
        let filter = GMSAutocompleteFilter()
        filter.type = .geocode
        client.findAutocompletePredictions(
            fromQuery: query,
            filter: filter,
            sessionToken: nil) { results, error in
                guard let results = results, error == nil else {
                    completion(.failure(PlacesError.failedToFind))
                    return
                }
                
                let places: [Places] = results.compactMap({
                    Places(
                        name: $0.attributedFullText.string,
                        identifier: $0.placeID
                    )
                })
                completion(.success(places))
            }
    }

}
