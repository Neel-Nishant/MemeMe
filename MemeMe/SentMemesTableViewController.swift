//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Neel Nishant on 27/12/17.
//  Copyright © 2017 Neel Nishant. All rights reserved.
//

import UIKit

var memes: [Meme]!
class SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tView.dataSource = self
        tView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
         tView.dataSource = self
        tView.delegate = self
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tView.reloadData()
        print("Memes: \(memes)")
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//
//
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let coun = memes {
            print("here1 \(memes.count)")
            return memes.count
            
        }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tView.dequeueReusableCell(withIdentifier: "SentMemeTableCell") as! SentMemeTableViewCell
        let meme = memes[indexPath.row]
        cell.titleLabel.text = meme.topText
//        cell.textLabel?.text = meme.topText
        print("UIImage\(meme.originalImage)")
        cell.img.image = UIImage(named: "\(meme.originalImage)")
//        cell.imageView?.image = UIImage(named: "\(meme.originalImage)")
        return cell
    }

}
