//
//  AppInfoViewController.swift
//  DayFinder
//
//  Created by Edgars Jaudzems on 02/02/2021.
//

import UIKit

class AppInfoViewController: UIViewController {

    @IBOutlet weak var phoneButtonsBackground: UIImageView!
    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    @IBOutlet weak var appStoreButton: UIImageView!
    @IBOutlet weak var tapMeLabel: UILabel!
    
    var infoText = String()
    let appDescText = "This app is a home work project."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDescLabel.text = appDescText
        phoneButtonsBackground.layer.cornerRadius = 20
        
        if !infoText.isEmpty {
            appDescLabel.text = infoText
        }
        
        // Clickable AppStore image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        appStoreButton.isUserInteractionEnabled = true
        appStoreButton.addGestureRecognizer(tapGestureRecognizer)

       

        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
        warningPopupInfo(withTitle: "Error", withMessage: "No internet connection!")
        
        tapMeLabel.text = "Don't tap me!"
        
    }
    
    func warningPopupInfo(withTitle title: String?, withMessage message: String?) {
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUp.addAction(okButton)
            self.present(popUp, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
