//  SelectedCategoryDetailsViewController.swift
//  WeddingBooking
//  Created by Aneesha on 10/05/24.

import UIKit

class SelectedCategoryDetailsViewController: UIViewController, CustomTableViewCellDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var lblTitleOfCategry: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var evntArry = [Event]()
    var filteredData: [Event] = []
    var indx = Int()
    var catgryName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" Evnt Arry count : \(evntArry.count)")
        print("selected catgryName ---->>:: \(catgryName)")
        lblTitleOfCategry.text = catgryName
        tblView.dataSource = self
        tblView.delegate = self
        searchTextField.delegate = self
        filteredData = evntArry
    }
    
    func didTapButton(model: Event) {
        print("did tap button View ")
        let selectedVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SelectedEventDetailsViewController") as? SelectedEventDetailsViewController
        selectedVC?.cellModel = model
        selectedVC?.selectedCatryName = catgryName
        self.navigationController?.pushViewController(selectedVC!, animated: true)
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        filterData(for: updatedText)
        return true
    }
    
    func filterData(for query: String) {
        if query.isEmpty {
            filteredData = evntArry
        } else {
            filteredData = evntArry.filter { $0.name.lowercased().contains(query.lowercased()) }
        }
        tblView.reloadData()
    }
}

extension SelectedCategoryDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = filteredData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfSelectedCatgryTableViewCell", for: indexPath) as! ListOfSelectedCatgryTableViewCell
        cell.lblOfEvnt.text = item.name
        cell.imageOfEvent.image = UIImage(named: item.image)
        cell.priceOfEvnt.text = item.price
        cell.cellModel = item
        cell.delegate = self
        return cell
    }
    
    
}

//
//        func jsonfile() {
//            // Usage
//            do {
//                let jsonData = try JSONSerialization.data(withJSONObject: JsonFile.jsonData.dataSet, options: [])
//                let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
//    //            print("jsonData -- \(json)")
//                if let value = json as? [String:Any] {
//    //                print("value -- \(value)")
//                    if let subValueData = value["data"] as? [String:Any] {
//                        print("subValueData -- \(subValueData)")
//    //                    if let catgryValue = subValueData["Category"] as? [[String: Any]] {
//    //                        print("catgryValue -- \(catgryValue)")
//    //                    }
//                    }
//                }
//            } catch {
//                print("Error converting to JSON: \(error.localizedDescription)")
//            }
//        }
//
//   
