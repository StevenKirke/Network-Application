//
//  PhotoTableViewController.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    let blur = Styles()
    var service: MarsRoverService?
    var photos = [RoverPhoto]()
    
    var rover: RoverType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "mars_desert.png"))
        
        blur.blurImage(image: tableView.backgroundView! as! UIImageView, view: tableView, style: .light)
        
        requestPhotos()
    }
    
    func requestPhotos() {
        guard let rover = rover else {
            return
        }
        service = MarsRoverService()
        
        service?.getPhotos(rover: rover, sol: 1000) { (photos, error) in
            self.service = nil
            if let photos = photos {
                self.photos = photos.photos
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PhotoCustomCellTableView {
            
            let photo = photos[indexPath.row]
            cell.selectionStyle = .none
            cell.loadImage(imageUrl: photo.imgSrc)
            return cell
        }
        return UITableViewCell()
    }
}
