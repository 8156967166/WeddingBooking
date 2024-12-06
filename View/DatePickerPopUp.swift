//
//  DatePickerPopUp.swift
//  WeddingBooking
//
//  Created by Aneesha on 30/05/24.
//

import UIKit


class DatePickerPopUp: UIView {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    var selectedFromDate = String()
    var selectedEndDate = String()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetuP(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DatePickerPopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
    
    func xibSetuP(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
}
