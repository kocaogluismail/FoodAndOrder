//
//  SepeteEklenenSayfasi.swift
//  AreYouHungry
//
//  Created by İsmail Kocaoglu on 6.02.2024.
//

import UIKit

class SepeteEklenenSayfasi: UIViewController {
   
    
  
    @IBOutlet weak var toplamFiyat: UILabel!
    
    @IBOutlet weak var yemeklerTableView: UITableView!
    var sepeteEklenenler: [YemekDetay] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        }

        
    
    

    @IBAction func odemeButton(_ sender: Any) {
    }

}

extension SepeteEklenenSayfasi : UITableViewDelegate,UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepeteEklenenler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetHucre
        
        let yemekDetay = sepeteEklenenler[indexPath.row]
        cell.imageViewResim.image = UIImage(named: yemekDetay.yemek_resim_adi ?? "")
        cell.labelYemekAd.text = yemekDetay.yemek_adi
        cell.labelToplamSayi.text = yemekDetay.yemek_siparis_adet
        cell.labelToplamTutar.text = "\(yemekDetay.yemek_fiyat ?? "") ₺"
        
        return cell
    }
}
