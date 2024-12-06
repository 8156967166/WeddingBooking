//
//  ZoomInOutImageViewController.swift
//  WeddingBooking
//
//  Created by Aneesha on 29/05/24.
//

import UIKit

class ZoomInOutImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var cellModel: Event!
    var indx = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: cellModel.imageAlbum[indx])
        setUpScrollView()
    }
    
    func setUpScrollView() {
        scrollView.delegate = self
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension ZoomInOutImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
