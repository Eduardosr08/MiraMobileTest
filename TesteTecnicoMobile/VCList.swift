//
//  VCList.swift
//  TesteTecnicoMobile
//
//  Created by Eduardo Reis on 04/08/2018.
//  Copyright © 2018 Eduardo Reis. All rights reserved.
//

import UIKit
import SystemConfiguration

class VCList: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
       view.backgroundColor = UIColor.black.withAlphaComponent(0.45)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       print("Index : \(indexSelected! - 1)")
    }
    
    @IBAction func close(_ sender: UIButton) {
    
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension VCList : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
     
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellNumber", for: indexPath) as! CellNumber
        
        
        
        if let arrayDados = arrayHistoric[indexSelected!]["arrayDados"] as? [Int]{

            cell.lbNumber.text = String(arrayDados[indice])
            indice += 1
            
        }
        
        return cell
    
    }
}

class CellNumber: UICollectionViewCell {
    
    @IBOutlet weak var lbNumber: UILabel!
}
