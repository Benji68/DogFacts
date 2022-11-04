//
//  MainListViewController.swift
//  DogFacts
//
//  Created by benjamin.chrysostom on 03/11/22.
//

import UIKit

var factCellIdentifier = "FactCellIdentifier"
var toListVCIdenitifier = "ToListVCIdenitifier"

class MainListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var factModel: [Fact] = []
    var number: Int?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        NetworkManager.shared.getDogFacts(number: number ?? 50) { [weak self] facts in
            self?.factModel = facts
            DispatchQueue.main.async() {
                self?.tableView.reloadData()
            }
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: factCellIdentifier) as! FactTableViewCell
        cell.cellModel = factModel[indexPath.row]
        return cell
    }
}
