//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Neel Nishant on 28/12/17.
//  Copyright © 2017 Neel Nishant. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var meme: Meme!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.memeImage.image = meme.memedImage
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.memeImage.image = meme.memedImage
        self.tabBarController?.tabBar.isHidden = true
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
}
