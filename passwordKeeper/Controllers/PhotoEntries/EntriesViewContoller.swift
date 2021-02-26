//
//  EntriesViewContoller.swift
//  passwordKeeper
//
//  Created by RD on 2/17/21.
//

import UIKit

class EntriesViewController: UIViewController{
 
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //customize cells
        var layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 120, height: 120)
        
        collectionView.register(EntriesViewCell.nib(), forCellWithReuseIdentifier: EntriesViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//picks up ineraction with cells
extension EntriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("you tapped me")
    }
}

extension EntriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2000
    }
    //deque cell in here
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EntriesViewCell.identifier, for: indexPath) as! EntriesViewCell
        
        cell.configure(with: UIImage(named: "Lock")!)
        return cell
    }
}

//what is margin and distance between each cell
extension EntriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 50, height: 50)
        }
}

