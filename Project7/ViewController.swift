//
//  ViewController.swift
//  Project7
//
//  Created by Jamie Auza on 1/30/18.
//  Copyright © 2018 Jamie Auza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var workouts = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlString: String
        switch navigationController?.tabBarItem.tag {
        case 0?:
            urlString = "https://raw.githubusercontent.com/danbev/training-ios/master/FHS/Models/test-workouts.json"
        case 1?:
            urlString = "https://raw.githubusercontent.com/danbev/training-ios/master/FHS/Models/test-workoutds.json"
        default:
            urlString = "https://raw.githubusercontent.com/danbev/training-ios/master/FHS/Models/test-workouts.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? String(contentsOf: url) {
                let json = JSON(parseJSON: data)
                parse(json: json)
                return
            }
        }
        showError()
    }
    func showError(){
        let alertController = UIAlertController(title: "Oops, something went wrong", message: "There seems to be an internet connection error, please try again later", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
    func parse(json: JSON){
        for result in json["workouts"]["workout"].arrayValue{
            let name = result["name"].stringValue
            let desc = result["desc"].stringValue
            let weightNeeded = result["weights"].stringValue
            let videoUrl = result["videoUrl"].stringValue
            let obj = ["name": name, "description" : desc,"videoUrl":videoUrl, "weightNeeded" : weightNeeded]
            workouts.append(obj)
        }
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = workouts[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = workouts[indexPath.row]["name"]
        cell.detailTextLabel?.text = workouts[indexPath.row]["weightNeeded"]
        return cell
    }
}

