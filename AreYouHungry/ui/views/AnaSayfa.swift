//
//  ViewController.swift
//  AreYouHungry
//
//  Created by İsmail Kocaoglu on 6.02.2024.
//

import UIKit

class AnaSayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    var yemeklerListesi = [Yemekler]()
    var yemekFiltresi = [Yemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        searchBar.delegate = self
        let f1 = Yemekler(yemek_id: 1, yemek_adi: "Django", yemek_resim_adi: "django", yemek_fiyat: 24)
        let f2 = Yemekler(yemek_id: 2, yemek_adi: "Interstellar", yemek_resim_adi: "interstellar", yemek_fiyat: 34)
        let f3 = Yemekler(yemek_id: 3, yemek_adi: "Inception", yemek_resim_adi: "inception", yemek_fiyat: 16)
        let f4 = Yemekler(yemek_id: 4, yemek_adi: "The Hateful Eight", yemek_resim_adi: "thehatefuleight", yemek_fiyat: 28)
        let f5 = Yemekler(yemek_id: 5, yemek_adi: "The Pianist", yemek_resim_adi: "thepianist", yemek_fiyat: 18)
        let f6 = Yemekler(yemek_id: 6, yemek_adi: "Anadoluda", yemek_resim_adi: "anadoluda", yemek_fiyat: 10)
        yemeklerListesi.append(f1)
        yemeklerListesi.append(f2)
        yemeklerListesi.append(f3)
        yemeklerListesi.append(f4)
        yemeklerListesi.append(f5)
        yemeklerListesi.append(f6)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        
        yemeklerCollectionView.collectionViewLayout = tasarim
    }


}

extension AnaSayfa:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.yemekFiltresi = self.yemeklerListesi.filter { f in
            if f.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.yemeklerCollectionView.reloadData()
    }
}

extension AnaSayfa: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemeklerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = yemeklerListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "yemeklerHucre", for: indexPath) as! YemeklerHucre
        
        hucre.imageViewYemek.image = UIImage(named: yemek.yemek_resim_adi!)
        hucre.labelYemekAdi.text = "\(yemek.yemek_adi!)"
        hucre.labelFiyat.text = "\(yemek.yemek_fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10.0
     
        
        return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemeklerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.yemek = yemek
            }
        }
    }
}
