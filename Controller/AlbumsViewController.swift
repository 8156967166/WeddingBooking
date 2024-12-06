//
//  AlbumsViewController.swift
//  WeddingBooking
//
//  Created by Aneesha on 29/05/24.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var selectedIndexPath = Int()
    var cellModel: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    @IBAction func buttonClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ZoomInOutImageViewController" {
            let destinationVC = segue.destination as? ZoomInOutImageViewController
            destinationVC?.cellModel = cellModel
            print("selectedIndexPath --- \(selectedIndexPath)")
            destinationVC?.indx = selectedIndexPath
        }
    }
}

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModel.imageAlbum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumTableViewCell
        cell.imageOfEvntAlbum.image = UIImage(named: cellModel.imageAlbum[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        performSegue(withIdentifier: "ZoomInOutImageViewController", sender: self)
    }
}
