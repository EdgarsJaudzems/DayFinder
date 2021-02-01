//
//  ViewController.swift
//  DayFinder
//
//  Created by Edgars Jaudzems on 01/02/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    
    @IBOutlet weak var monthTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var findButton: UIButton!
    //change from find to clear
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func findWeekDayTapped(_ sender: Any) {
        
        // calendar
        //DateComponents()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        let calendar = Calendar.current
        
        var dateComponent = DateComponents()
        
        dateComponent.day = Int(dayTextField.text ?? "01")
        dateComponent.month = Int(monthTextField.text ?? "01")
        dateComponent.year = Int(yearTextField.text ?? "2021")
        
        let day = calendar.date(from: dateComponent)
        
        
        //
        // dateComponents.day = daytextfielt.text
        // calendar.date(from: dateComponents
        // DateFormatter()
        //resultLabel.text = result
        
    }
    
}

