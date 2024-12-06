//
//  ListOfSelectedCatgryTableViewCell.swift
//  WeddingBooking
//
//  Created by Aneesha on 10/05/24.
//
//star.leadinghalf.filled
import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapButton(model: Event)
}


class ListOfSelectedCatgryTableViewCell: UITableViewCell {

    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var SecondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    @IBOutlet weak var imageOfEvent: UIImageView!
    @IBOutlet weak var lblOfEvnt: UILabel!
    @IBOutlet weak var priceOfEvnt: UILabel!
    
    var delegate: CustomTableViewCellDelegate?
    
    var cellModel: Event! {
        didSet {
            setRatingData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRatingData() {
        if cellModel.rating == 1.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 2.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 3.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 4.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 5.0 {
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.fill")
            fifthStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating > 0.0 &&  cellModel.rating < 1.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 1.0 &&  cellModel.rating < 2.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 2.0 &&  cellModel.rating < 3.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 3.0 &&  cellModel.rating < 4.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 4.0 &&  cellModel.rating < 5.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            SecondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.fill")
            fifthStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }
    }
    
    func disableStars() {
        firstStar.image = UIImage(systemName: "star")
        SecondStar.image = UIImage(systemName: "star")
        thirdStar.image = UIImage(systemName: "star")
        fourthStar.image = UIImage(systemName: "star")
        fifthStar.image = UIImage(systemName: "star")
    }

    @IBAction func buttonClickedView(_ sender: UIButton) {
        delegate?.didTapButton(model: cellModel)
    }
}
