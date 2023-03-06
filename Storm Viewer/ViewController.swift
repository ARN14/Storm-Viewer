//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Abdurrahman Naveed on 10/07/2020.
//  Copyright © 2020 Abdurrahman Naveed. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title at the top of the navigation bar for this view
        title = "Storm Viewer"
        // This makes the title large, used for the main page only usually, but this effects everything, so we need to make the others not get bigger
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //Here we are getting the pictures
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //"This is a picture to load!"
                pictures.append(item)
            }
        }
        pictures.sort()
        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    
    //Doing stuff when the user presses a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //making the variable "vc" to be our detail view controller
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            //Setting the detail variable to be whatever the user presses
            vc.selectedImage = pictures[indexPath.row]
            //Show the screen
            navigationController?.pushViewController(vc, animated: true)
            vc.imageNumber = pictures
            vc.imageNumber2 = indexPath.row + 1
        }
    }

}

