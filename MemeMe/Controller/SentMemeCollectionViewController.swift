//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by Neel Nishant on 27/12/17.
//  Copyright © 2017 Neel Nishant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SentMemeCollectionViewCell"

class SentMemeCollectionViewController: UICollectionViewController {
    var memes: [Meme]!
    var memeDetail: Meme!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()

        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        self.collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (memes) != nil {
            return memes.count
            
        }
        else {
            return 0
        }

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SentMemeCollectionViewCell
        let meme = memes[indexPath.row]
        cell.memeImage.image = meme.memedImage
        cell.memeImage.contentMode = .scaleAspectFit
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        memeDetail = memes[indexPath.row]
        performSegue(withIdentifier: "memeFromCollection", sender: self)
        
    }
    //MARK:- prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memeFromCollection" {
            let controller = segue.destination as! MemeDetailViewController
            controller.meme = memeDetail
        }
    }

}
