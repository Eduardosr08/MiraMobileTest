//
//  HistoricoTableViewController.swift
//  TesteTecnicoMobile
//
//  Created by Eduardo Reis on 02/08/2018.
//  Copyright © 2018 Eduardo Reis. All rights reserved.
//

import UIKit

var indexSelected : Int?
var indice = Int()

class HistoricTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.purple
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayHistoric.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if(indexPath.row == 0){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellHeader", for: indexPath)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as! CellData
        
        if let numberTyped = arrayHistoric[indexPath.row - 1]["numeroDigitado"] as? String {
            
            cell.lblNumber.text = numberTyped
        }
        
        if let result = arrayHistoric[indexPath.row - 1]["status"] as? String {
            
            cell.lblResult.text = result
        }
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        indexSelected = indexPath.row - 1
        indice = 0

    }

}

class CellData: UITableViewCell {
    
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
}
