//
//  PetsCollectionCell.swift
//  SepiaInnovationTask
//
//  Created by Rana on 28/11/22.
//

import UIKit

protocol UserAlert :AnyObject{
  func message()
}

class PetsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var petsName: UILabel!
    @IBOutlet weak var petsImage: PetsImageView!
    weak var delegate:UserAlert?
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    
    func getPetsCount()-> Int {
        let todayDay = getTodayWeekDay()
        let currentTime = getCurrentTime()
        let startNumber = 9
        let endNumber = 17
        let numberRange = startNumber...endNumber
        if  todayDay != "Saturday" && todayDay != "Sunday" {
            if numberRange.contains(Int(currentTime)!) {
                return PetsListViewModel.shared.getPetsListCount()
            }
        }
        delegate?.message()
        return 0
    }

    func getPetsInfo(indexValue:Int){
          let petsObj = PetsListViewModel.shared.getPetsList(inndexValue: indexValue)
        if let petsInfo = petsObj {
            petsName.text = petsInfo.title
            petsImage.loadImage(fromURL: petsInfo.image_url ?? "")
        }
    }
    
    func getTodayWeekDay()-> String{
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE"
           let weekDay = dateFormatter.string(from: Date())
           return weekDay
     }
    
    func getCurrentTime()-> String {
        let todaysDate:NSDate = NSDate()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H"
        let dateInFormat:String = dateFormatter.string(from:todaysDate as Date)
        return dateInFormat
    }
}
