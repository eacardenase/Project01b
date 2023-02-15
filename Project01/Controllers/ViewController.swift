//
//  ViewController.swift
//  Project01
//
//  Created by Edwin Cardenas on 1/7/23.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var pictures = [Picture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                
                let picture = Picture(imageName: item)
                
                pictures.append(picture)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? PictureCell else { fatalError("Could not typecast cell as PictureCell") }

        let picture = pictures[indexPath.item]
        
        cell.imageName.text = picture.imageName
        cell.imageView.image = UIImage(named: picture.imageName)

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailVC {

            vc.imageData = ["imagePosition": "\(indexPath.item + 1)", "picturesCount": "\(pictures.count)", "imageName": pictures[indexPath.item].imageName]

            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

