//
//  RoversTableViewController.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import UIKit

class RoversTableViewController: UITableViewController {
    
    let blur = Styles()    
    let rovers = RoverType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: UIImage(named: "mars_desert.png"))
        
        blur.blurImage(image: tableView.backgroundView! as! UIImageView, view: tableView, style: .light)
        
        print(rovers)    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rovers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RoverCustomTableViewCell else { return UITableViewCell() }
        
        let rover = rovers[indexPath.row]
        cell.selectionStyle = .none
        cell.photoRoverLabel.image = rover.image
        cell.nameRoverLabel.text = "\(rover.rawValue)"
        print(rover.rawValue)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPhoto", sender: rovers[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoTableViewController, let rover = sender as? RoverType else { return }
        photoVC.rover = rover
    }
}

