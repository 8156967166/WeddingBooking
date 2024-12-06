//
//  PhotosListCollectionViewCell.swift
//  WeddingBooking
//
//  Created by Aneesha on 24/05/24.
//

import UIKit

protocol PhotosListCollectionViewCellDelegate: AnyObject {
    func didTapButton(model: Event)
}

class PhotosListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgOfPhotosList: UIImageView!
}
