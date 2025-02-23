//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Beyza Aslan on 23.02.2025.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var LandmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkLabel = ""    //SEÇİLEN İSİM
    var selectedimageView = UIImage()   //SEÇİLEN GÖRSEL DEMEK
    

    override func viewDidLoad() {
        super.viewDidLoad()
        LandmarkLabel.text = selectedLandmarkLabel
        imageView.image = selectedimageView
  
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
