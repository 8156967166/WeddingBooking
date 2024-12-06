//
//  DateAndTimeViewController.swift
//  WeddingBooking
//
//  Created by Aneesha on 30/05/24.
//

import UIKit

class DateAndTimeViewController: UIViewController {

    var datePickerPopup: DatePickerPopUp!
    var selectedDate = String()
    var isSelectFromDatebtn = Bool()
    var isSelectEndDatebtn = Bool()
    var isSelectFromTimebtn = Bool()
    var isSelectEndTimebtn = Bool()
    var fromDate: Date?
    var toDate: Date?
    var cellModel: Event!
    
    @IBOutlet weak var lblTitleOfEvntName: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblToTime: UILabel!
    @IBOutlet weak var lblFromTime: UILabel!
    @IBOutlet weak var lblFromDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let todayDate = dateFormatter.string(from: Date())
        lblFromDate.text = todayDate
        lblEndDate.text = todayDate
        
        dateFormatter.timeStyle = .short
        let currentTime = dateFormatter.string(from: Date())
        lblFromTime.text = currentTime
        lblToTime.text =  currentTime
        lblTotalPrice.text = "Price INR \(cellModel.price)"
        lblTitleOfEvntName.text = cellModel.name
    }
    
    func setDatePicker() {
        self.datePickerPopup = DatePickerPopUp(frame: self.view.frame)
        self.datePickerPopup.buttonDone.layer.cornerRadius = 6
        self.datePickerPopup.buttonCancel.layer.cornerRadius = 6
        self.datePickerPopup.popupView.layer.cornerRadius = 10
        self.datePickerPopup.datePickerView.minimumDate = Date()
        if isSelectFromTimebtn == true {
            self.datePickerPopup.datePickerView.datePickerMode = .time
        }else if isSelectEndTimebtn == true {
            self.datePickerPopup.datePickerView.datePickerMode = .time
        }else {
            self.datePickerPopup.datePickerView.datePickerMode = .date
        }
        self.datePickerPopup.buttonDone.addTarget(self, action: #selector(donebtnTaped), for: .touchUpInside)
        self.datePickerPopup.buttonCancel.addTarget(self, action: #selector(cancelbtnTaped), for: .touchUpInside)
        self.view.addSubview(datePickerPopup)
    }
    
    @objc func donebtnTaped() {
        print("donebtnTaped")
        if isSelectFromDatebtn == true {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            selectedDate = dateFormatter.string(from: self.datePickerPopup.datePickerView.date)
            print("selectedDate -- \(selectedDate)")
            fromDate = self.datePickerPopup.datePickerView.date
            lblFromDate.text = selectedDate
            setDateDiffernce()
        }else if isSelectEndDatebtn == true {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            selectedDate = dateFormatter.string(from: self.datePickerPopup.datePickerView.date)
            print("selectedDate -- \(selectedDate)")
            toDate = self.datePickerPopup.datePickerView.date
            lblEndDate.text = selectedDate
            setDateDiffernce()
        }else if isSelectFromTimebtn == true {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let selectedTime = formatter.string(from: self.datePickerPopup.datePickerView.date)
            print("Selected time: \(selectedTime)")
            lblFromTime.text = selectedTime
        }else {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let selectedTime = formatter.string(from: self.datePickerPopup.datePickerView.date)
            print("Selected time: \(selectedTime)")
            lblToTime.text = selectedTime
        }
        
        self.datePickerPopup.removeFromSuperview()
    }
    
    @objc func cancelbtnTaped() {
        print("cancelbtnTaped")
        self.datePickerPopup.removeFromSuperview()
    }
    
    func setDateDiffernce() {
        let dateDifference = Calendar.current.dateComponents([.day], from: fromDate ?? Date(), to: toDate ?? Date())
        // Step 1: Remove the currency symbol
        let stringWithoutCurrencySymbol = cellModel.price.replacingOccurrences(of: "₹", with: "")

        // Step 2: Remove commas
        let stringWithoutCommas = stringWithoutCurrencySymbol.replacingOccurrences(of: ",", with: "")

        if lblFromDate.text == lblEndDate.text {
            lblTotalPrice.text = "Price INR \(cellModel.price)"
        }else {
            // Step 3: Convert to integer
            if let integerValue = Int(stringWithoutCommas) {
                print("The integer value is \(integerValue)")
                if let days = dateDifference.day {
                    print("Difference: \(days) days")
                    let totalPrice = integerValue * days
                    print("totalPrice -- \(totalPrice)")
                    let formattedAmount = formatAmount(amount: Double(totalPrice))
                    lblTotalPrice.text = "Price INR \(formattedAmount)"
                } else {
                    print("Difference: N/A")
                }
            } else {
                print("Conversion failed")
            }
        }
    }
    
    func formatAmount(amount: Double) -> String {
        // Create a NumberFormatter instance
        let formatter = NumberFormatter()
        
        // Set the number style to currency
        formatter.numberStyle = .currency
        
        // Set the locale to Indian (India)
        formatter.locale = Locale(identifier: "en_IN")
        
        // Format the amount as a string
        if let formattedAmount = formatter.string(from: NSNumber(value: amount)) {
            return formattedAmount
        } else {
            return "Invalid Amount"
        }
    }
    
    @IBAction func buttonTimePicker(_ sender: UIButton) {
        if sender.tag == 1 {
            isSelectFromDatebtn = false
            isSelectEndDatebtn = false
            isSelectEndTimebtn = false
            isSelectFromTimebtn = true
            setDatePicker()
        }else {
            isSelectFromDatebtn = false
            isSelectEndDatebtn = false
            isSelectFromTimebtn = false
            isSelectEndTimebtn = true
            setDatePicker()
        }
    }
    
    @IBAction func buttonEndDatePicker(_ sender: UIButton) {
        isSelectFromDatebtn = false
        isSelectFromTimebtn = false
        isSelectEndTimebtn = false
        isSelectEndDatebtn = true
        setDatePicker()
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonStartDatePicker(_ sender: UIButton) {
        isSelectEndDatebtn = false
        isSelectFromTimebtn = false
        isSelectEndTimebtn  = false
        isSelectFromDatebtn = true
        setDatePicker()
    }
}
