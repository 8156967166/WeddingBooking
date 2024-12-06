//
//  SelectedEventDetailsViewController.swift
//  WeddingBooking
//  Created by Aneesha on 19/05/24.


import UIKit

class SelectedEventDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblDecrbtnAbout: UILabel!
    @IBOutlet weak var heightOftblPolicies: NSLayoutConstraint!
    @IBOutlet weak var tblViewPolicies: UITableView!
    @IBOutlet weak var heightOftblOfferng: NSLayoutConstraint!
    @IBOutlet weak var tblViewOffering: UITableView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblEvntName: UILabel!
    @IBOutlet weak var titleOfCatgryName: UILabel!
    @IBOutlet weak var imageSelectedEvnt: UIImageView!
    @IBOutlet weak var collctnView: UICollectionView!
    @IBOutlet weak var fifthStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var imageSave: UIImageView!
    @IBOutlet weak var lblPhone: UILabel!
    
    var cellModel: Event!
    var selectedCatryName = String()
    fileprivate let application = UIApplication.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPrice.text = cellModel.price
        titleOfCatgryName.text = selectedCatryName
        lblEvntName.text = cellModel.name
        lblDecrbtnAbout.text = cellModel.about
        imageSelectedEvnt.image = UIImage(named: cellModel.image)
        collctnView.delegate = self
        collctnView.dataSource = self
        setRatingData()
        setTableViewOffering()
        imageSave.image = UIImage(named: "save")
    }
    
    override func viewWillLayoutSubviews() {
        self.heightOftblOfferng.constant = self.tblViewOffering.contentSize.height
        self.heightOftblPolicies.constant = self.tblViewPolicies.contentSize.height
    }
    
    private func setTableViewOffering() {
        tblViewOffering.delegate = self
        tblViewOffering.dataSource = self
        tblViewPolicies.delegate = self
        tblViewPolicies.dataSource = self
        tblViewOffering.register(UINib(nibName: "OfferingTableViewCell", bundle: nil), forCellReuseIdentifier: "OfferingTableViewCell")
        tblViewPolicies.register(UINib(nibName: "OfferingTableViewCell", bundle: nil), forCellReuseIdentifier: "OfferingTableViewCell")
    }
    
    func setRatingData() {
        if cellModel.rating == 1.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 2.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 3.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 4.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating == 5.0 {
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.fill")
            fifthStar.image = UIImage(systemName: "star.fill")
        }else if cellModel.rating > 0.0 &&  cellModel.rating < 1.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 1.0 &&  cellModel.rating < 2.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 2.0 &&  cellModel.rating < 3.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 3.0 &&  cellModel.rating < 4.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }else if cellModel.rating > 4.0 &&  cellModel.rating < 5.0 {
            disableStars()
            firstStar.image = UIImage(systemName: "star.fill")
            secondStar.image = UIImage(systemName: "star.fill")
            thirdStar.image = UIImage(systemName: "star.fill")
            fourthStar.image = UIImage(systemName: "star.fill")
            fifthStar.image = UIImage(systemName: "star.leadinghalf.filled")
        }
    }
    
    func disableStars() {
        firstStar.image = UIImage(systemName: "star")
        secondStar.image = UIImage(systemName: "star")
        thirdStar.image = UIImage(systemName: "star")
        fourthStar.image = UIImage(systemName: "star")
        fifthStar.image = UIImage(systemName: "star")
    }
    
    @IBAction func buttonActionShare(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
        let sheetPresentController = storyboard.instantiateViewController(withIdentifier: "SheetViewController") as! SheetViewController
        sheetPresentController.cellModel = cellModel
        self.present(sheetPresentController, animated: true, completion: nil)
    }
    
    @IBAction func buttonBook(_ sender: UIButton) {
        let selectedVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DateAndTimeViewController") as? DateAndTimeViewController
        selectedVC?.cellModel = cellModel
        self.navigationController?.pushViewController(selectedVC!, animated: true)
    }
    
    @IBAction func buttonActionSave(_ sender: UIButton) {
        if imageSave.image == UIImage(named: "save") {
            imageSave.image = UIImage(named: "saveFill")
        }else {
            imageSave.image = UIImage(named: "save")
        }
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonCall(_ sender: UIButton) {
        print("buttonCall Tapped")
        if let phoneURL = URL(string: "tel://0123456789") {
            if application.canOpenURL(phoneURL) {
                application.open(phoneURL, options: [:], completionHandler: nil)
            }else {
                //Alert
                print("Error")
            }
        }
    }
}

extension SelectedEventDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModel.imageAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosListCollectionViewCell", for: indexPath) as! PhotosListCollectionViewCell
        cell.imgOfPhotosList.image = UIImage(named: cellModel.imageAlbum[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let albumsPresentController = storyboard.instantiateViewController(withIdentifier: "AlbumsViewController") as! AlbumsViewController
        albumsPresentController.cellModel = cellModel
        self.present(albumsPresentController, animated: true, completion: nil)
    }
}

extension SelectedEventDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewOffering {
            return cellModel.offerings.count
        }else {
            return cellModel.policies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OfferingTableViewCell", for: indexPath) as! OfferingTableViewCell
        if tableView == tblViewOffering {
            cell.lblOfferngNames.text = cellModel.offerings[indexPath.row]
        }else {
            cell.lblOfferngNames.text = cellModel.policies[indexPath.row]
        }
        return cell
    }
}
