//
//  InitialViewController.swift
//  DogFacts
//
//  Created by benjamin.chrysostom on 03/11/22.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonClicked() {
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == toListVCIdenitifier, let destVC = segue.destination as? MainListViewController  {
            let number = textField.text
            destVC.number = Int(number ?? "50") ?? 50
        }
    }
    

}
