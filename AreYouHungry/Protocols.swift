//
//  Protocols.swift
//  AreYouHungry
//
//  Created by İsmail Kocaoglu on 7.02.2024.
//

import Foundation

protocol DetaySayfaDelegate: AnyObject {
    func sepeteEklendi(sepet_yemek_id:String,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat: String,yemek_siparis_adet:String,kullanici_adi : String)
      
    
  
}
