//
//  YemeklerHucre.swift
//  AreYouHungry
//
//  Created by İsmail Kocaoglu on 6.02.2024.
//

import UIKit

protocol YemekProtocol{
    func sepeteEkleTikla(indexPath:IndexPath)
    
}


class YemeklerHucre: UICollectionViewCell {
    
    
    @IBOutlet weak var imageViewYemek: UIImageView!
    
    @IBOutlet weak var labelYemekAdi: UILabel!
    
    @IBOutlet weak var labelFiyat: UILabel!
}
