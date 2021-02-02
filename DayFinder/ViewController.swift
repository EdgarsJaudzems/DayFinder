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
        findButtonUI()

    }

    @IBAction func findWeekDayTapped(_ sender: Any) {
        
        // Calendar
        let calendar = Calendar.current
       
        // Date component
        var dateComponents = DateComponents()
        
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!)  else {
            //Alert
            warningPopup(withTitle: "Input error", withMessage: "Date fields can't be empty.")
            return
        }
        
        // Date components = daytextfield.text
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        // Calendar.date(from: dateComponents)
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        // Date Formater()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        // Find button
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                
                // Result
                resultLabel.text = capitalizedWeekday
            } else {
                // Alert
                warningPopup(withTitle: "Wrong date", withMessage: "Enter correct date.")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearAllTextFields()
        }
        
//        let calendar = Calendar.current
//
//        var dateComponents = DateComponents()
//        dateComponents.day = Int(dayTextField.text ?? "02")
//        dateComponents.month = Int(monthTextField.text ?? "02")
//        dateComponents.year = Int(yearTextField.text ?? "2021")
//
//        let date = calendar.date(from: dateComponents)
//
//        let dateFormatter = DateFormatter()
//        //dateFormatter.dateFormat = "dd.MM.yyyy"
//        dateFormatter.dateFormat = "EEEE"
//        let weekday = dateFormatter.string(from: date!)
//
//        if dateComponents.day != nil && dateComponents.month != nil && dateComponents.year != nil  {
//            resultLabel.text = "That is \(weekday)!!!"
//
//        } else {
//            resultLabel.text = "Enter a day, month and year!"
//        }
//
//        clearButton()
    }
    
//    func clearButton() {
//        if buttonPressedBool == false {
//            buttonPressedBool = true
//            findButton.setTitle("Clear", for: .normal)
//        } else {
//            buttonPressedBool = false
//            findButton.setTitle("Find", for: .normal)
//            dayTextField.text = nil
//            monthTextField.text = nil
//            yearTextField.text = nil
//            resultLabel.text = "Enter a day, month and year!"
//        }
//    }
    
    func clearAllTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Day of the week, inside finder"
    }
    
    func findButtonUI() {
        findButton.layer.cornerRadius = 20
        findButton.layer.borderWidth = 3
        findButton.layer.borderColor = UIColor.white.cgColor
    }
    
    // Ja pieskaras ekranam, kur nav aktivi elementi, klaviatura aizversies
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Warning PopUp Alert
    func warningPopup(withTitle title: String?, withMessage message: String?) {
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUp.addAction(okButton)
            self.present(popUp, animated: true, completion: nil)
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayFinder" {
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! AppInfoViewController
            // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps to find exact weekday for given date."
        }
        
        
        
    }
    
 
}

