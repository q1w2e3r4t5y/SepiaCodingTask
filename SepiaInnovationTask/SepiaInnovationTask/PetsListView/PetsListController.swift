//
//  ViewController.swift
//  SepiaInnovationTask
//
//  Created by Rana on 28/11/22.
//

import UIKit
import SafariServices

class PetsListController: UIViewController ,UserAlert{
    
@IBOutlet weak var collectionView: UICollectionView!
var cellObj = PetsCollectionCell()
    override func viewDidLoad() {
        super.viewDidLoad()
         self.initialUISetUP()
        cellObj.delegate = self
    }
    
    func initialUISetUP(){
      let cellSize = CGSize(width:collectionView.frame.width/2.8 , height:collectionView.frame.width/2.5)
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.itemSize = cellSize
      layout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 1, right: 30)
      layout.minimumLineSpacing = 10.0
      layout.minimumInteritemSpacing = 1.0
      collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func message() {
    let alert = UIAlertController(title: "OOPS!", message: "Service Available between 9 PM to 6 PM", preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
    }
    
   
}

extension PetsListController:UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellObj.getPetsCount()
     }
     
    func notificationForUser(){
       
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
    
}

extension PetsListController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetsCollectionCell", for: indexPath) as! PetsCollectionCell
        cell.getPetsInfo(indexValue: indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let petsDetails = PetsListViewModel.shared.getPetsList(inndexValue: indexPath.row)
        let url = URL(string: petsDetails?.content_url ?? "")
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true, completion: nil)
    
    }
}
