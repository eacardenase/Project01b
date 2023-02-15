//
//  DetailVC.swift
//  Project01
//
//  Created by Edwin Cardenas on 1/8/23.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    
    var imageData: [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        if let imageDic = imageData {
            let picturesCount = imageDic["picturesCount"]!
            let imageIndex = imageDic["imagePosition"]!
            
            title = "\(imageIndex) of \(picturesCount)"
            backgroundImage.image = UIImage(named: imageDic["imageName"] ?? "nssl0039.jpg")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
