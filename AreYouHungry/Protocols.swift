//
//  Protocols.swift
//  AreYouHungry
//
//  Created by İsmail Kocaoglu on 7.02.2024.
//

import Foundation
protocol YemekDetayProtocolFirst{
    
    var foodDetail : YemekDetayProtocolSecond? {get set}
    
    func sepeteHepsiniEkle(yemek_adi : String, yemek_fiyat : String, yemek_resim_adi : String, yemek_siparis_adet:String, kullanici_adi:String)
}
protocol YemekDetayProtocolSecond {
    func sepeteEkle(yemek_adi : String, yemek_fiyat : String, yemek_resim_adi : String, yemek_siparis_adet:String, kullanici_adi:String)
}
protocol YemekDetayProtocolThird {
    static func modulYaratma(ref:DetaySayfa)
}
