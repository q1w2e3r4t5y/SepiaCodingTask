//
//  PetsImage.swift
//  SepiaInnovationTask
//
//  Created by ITADMIN on 29/11/22.
//

import Foundation
import UIKit

class PetsImageView: UIImageView
{
    func loadImage(fromURL imageURL: String)
    {
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: URL(string: imageURL)!)
            {
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        
                        self?.image = image
                    }
                }
            }
        }
    }
}
