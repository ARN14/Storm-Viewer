import UIKit


class DetailViewController: UIViewController {
    // Setting variables from previous view

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var imageNumber = [String]()
    var imageNumber2 = 0


    override func viewDidLoad() {
        //This function handles Unwrapping selectedImage, and setting the view to be that image, as well as setting the title

        super.viewDidLoad()

        title = "Picture \(imageNumber2) of \(imageNumber.count)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        // This function will hide the title bars and make the images fullscreen when tapping
        
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }


    override func viewWillDisappear(_ animated: Bool) {
        // Stops the functionality to hide title bars when returning to main view
        
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
