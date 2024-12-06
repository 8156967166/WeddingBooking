//  SheetViewController.swift
//  WeddingBooking
//  Created by Aneesha on 28/05/24.

import UIKit

class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    @IBOutlet weak var colltnView: UICollectionView!
    @IBOutlet weak var lblCopyLink: UILabel!
    
    var nameArry = ["WhatsApp", "Messages", "News Feed", "Telegram", "Gmail", "Messages", "Bluetooth"]
    var imgArry = ["whatsappImg", "instagramImg", "facebook", "telegramImg", "gmailImg", "messagesImg", "bluetoothImg"]
    var cellModel: Event!
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [
            .medium()
        ]
        colltnView.delegate = self
        colltnView.dataSource = self
    }

    @IBAction func buttonCopyLink(_ sender: UIButton) {
        print("Copied")
        UIPasteboard.general.string = cellModel.link
        lblCopyLink.text = "Copied"
        self.dismiss(animated: true)
    }
}

extension SheetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SheetCollectionViewCell", for: indexPath) as! SheetCollectionViewCell
        cell.lblOfShare.text = nameArry[indexPath.item]
        cell.imageOfShareIcon.image = UIImage(named: imgArry[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 4
        return CGSize(width: width, height: 100)
    }
}
