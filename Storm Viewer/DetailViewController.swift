//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Abdurrahman Naveed on 11/07/2020.
//  Copyright © 2020 Abdurrahman Naveed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    //This variable comes from didSelectRowAt, whtever the name of the picture in that row is pushed here
    var selectedImage: String?
    var imageNumber = [String]()
    var imageNumber2 = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Picture \(imageNumber2) of \(imageNumber.count)"
        //Navigation item only affects one screen, we are telling it not to use large title like we set on the first view controller
        navigationItem.largeTitleDisplayMode = .never

        //Unwrapping selectedImage optional and setting the view to be that image
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    //make the images fullscreen when tapping, this is under a function like viewdidload that runs at a certain time, we only want the taps to work when the detail view is about to show, otherwise they will work on the previous screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
