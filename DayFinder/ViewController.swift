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
    
    var buttonPressedBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findButton.layer.cornerRadius = 20
    }

    @IBAction func findWeekDayTapped(_ sender: Any) {
                
        
        let calendar = Calendar.current

        var dateComponents = DateComponents()
        
        dateComponents.day = Int(dayTextField.text ?? "02")
        dateComponents.month = Int(monthTextField.text ?? "02")
        dateComponents.year = Int(yearTextField.text ?? "2021")
        
        let date = calendar.date(from: dateComponents)
  
        
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.dateFormat = "EEEE"
        let weekday = dateFormatter.string(from: date!)
        

        if dateComponents.day != nil && dateComponents.month != nil && dateComponents.year != nil  {
            resultLabel.text = "That is \(weekday)!!!"
            
        } else {
            resultLabel.text = "Enter a day, month and year!"
        }
        
        if buttonPressedBool == false {
            buttonPressedBool = true
            findButton.setTitle("Clear", for: .normal)
        } else {
            buttonPressedBool = false
            findButton.setTitle("Find", for: .normal)
            dayTextField.text = nil
            monthTextField.text = nil
            yearTextField.text = nil
            resultLabel.text = "Enter a day, month and year!"
        }
  
    }
    
 
}

