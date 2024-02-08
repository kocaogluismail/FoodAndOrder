//
//  DetaySayfa.swift
//  AreYouHungry
//
//  Created by İsmail Kocaoglu on 6.02.2024.
//

import UIKit
import Alamofire
import Kingfisher

class DetaySayfa: UIViewController {
    @IBOutlet weak var imageViewYemek: UIImageView!
    
    @IBOutlet weak var labelYemekAd: UILabel!
    
    
    @IBOutlet weak var artı: UIButton!
    
    
    @IBOutlet weak var eksi: UIButton!
    
    
    @IBOutlet weak var labelToplamSayi: UILabel!
    
    @IBOutlet weak var labelToplamFiyat: UILabel!
    
    
    @IBOutlet weak var sepeteEkle: UIButton!
    
    var count : Int = 1
    var yemek: Yemekler?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        if let y = yemek{
            labelYemekAd.text = y.yemek_adi
            labelToplamFiyat.text = "\(y.yemek_fiyat!)₺"
            imageViewYemek.image = UIImage(named: y.yemek_resim_adi!)
            
        }
        
    }
    func updateUI() {
        sepeteEkle.layer.cornerRadius = 10
    }
    
    func ekle() {
        if count >= 1 && count < 20 {
            count += 1
        }
        labelToplamSayi.text = "\(count)"
        
        if let y = yemek {
            let yemekFiyat = Int(y.yemek_fiyat!)
            labelToplamFiyat.text = "\(yemekFiyat * count)₺"
        }
    }
    
    func azalt() {
        if count > 1 && count <= 20 {
            count -= 1
        }
        labelToplamSayi.text = "\(count)"
        
        if let y = yemek {
            let yemekFiyat = Int(y.yemek_fiyat!)
            labelToplamFiyat.text = "\(yemekFiyat * count) ₺"
        }
    }
    
    @IBAction func artıButton(_ sender: Any) {
        azalt()
    }
    
    @IBAction func eksiButton(_ sender: Any) {
        ekle()
    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        
        if let y = yemek {
            
            sepeteEkle(yemek_adi: y.yemek_adi!, yemek_resim_adi: y.yemek_resim_adi!, yemek_fiyat: y.yemek_fiyat!)
            
            
            let alert = UIAlertController(title: "Add to Cart", message: "\(y.yemek_adi!) sepete eklendi.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default) {
                action in self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true)
        }
    }
    func sepeteEkle( yemek_adi : String,yemek_resim_adi : String,yemek_fiyat : Int) {
        print("Kaydet:\(yemek_adi)-\(yemek_resim_adi)-\(yemek_fiyat)")
    }
    
}

extension DetaySayfa : YemekProtocol {
    func sepeteEkleTikla(indexPath: IndexPath) {
        
    }
    
    
}
