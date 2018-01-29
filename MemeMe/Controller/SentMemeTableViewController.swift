//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Neel Nishant on 27/12/17.
//  Copyright © 2017 Neel Nishant. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UITableViewController {
    
    var memes = [Meme]()
    var memeDetail: Meme!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.rowHeight = 140
        
        memes = appDelegate.memes
        self.tableView.reloadData()
        print("Memes: \(memes)")

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return memes.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemeTableViewCell", for: indexPath) as! SentMemeTableViewCell
        let meme = memes[indexPath.row]
        cell.img.image = meme.memedImage
        cell.label.text = "\(meme.topText)...\(meme.bottomText)"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        memeDetail = memes[indexPath.row]
        performSegue(withIdentifier: "memeFromTable", sender: self)
    }

    //MARK:- Delete the row by swiping
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memes.remove(at: indexPath.row)
            appDelegate.memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK:- prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memeFromTable"{
            let controller = segue.destination as! MemeDetailViewController
            controller.meme = memeDetail
        }
    }
   
}
