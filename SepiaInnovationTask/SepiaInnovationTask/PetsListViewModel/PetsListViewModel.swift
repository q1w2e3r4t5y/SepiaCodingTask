//
//  PetsListViewModel.swift
//  SepiaInnovationTask
//
//  Created by Rana on 28/11/22.
//

import Foundation

class PetsListViewModel {
    
    static let shared = PetsListViewModel()
    var getdata = getData()
    var data =  [Pets]()
   
   private init(){
        self.data = getdata.getListData()
    }
    
    func getPetsList(inndexValue:Int)-> Pets? {
        return data[inndexValue]
    }
    
    func getPetsListCount()-> Int {
        return data.count
    }
}
