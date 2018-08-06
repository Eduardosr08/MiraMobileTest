//
//  ViewController.swift
//  TesteTecnicoMobile
//
//  Created by Eduardo Reis on 02/08/2018.
//  Copyright © 2018 Eduardo Reis. All rights reserved.
//

import UIKit

//Propriedades Globais
var arrayHistoric : [[String : Any]] = []

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var labelNum1: UILabel!
    @IBOutlet weak var labelNum2: UILabel!
    @IBOutlet weak var labelNum3: UILabel!
    @IBOutlet weak var labelNum4: UILabel!
    @IBOutlet weak var labelNum5: UILabel!
    @IBOutlet weak var labelNum6: UILabel!
    @IBOutlet weak var labelNum7: UILabel!
    @IBOutlet weak var labelNum8: UILabel!
    @IBOutlet weak var labelNum9: UILabel!
    @IBOutlet weak var labelNum10: UILabel!
    @IBOutlet weak var labelNum11: UILabel!
    @IBOutlet weak var labelNum12: UILabel!
    @IBOutlet weak var labelNum13: UILabel!
    @IBOutlet weak var labelNum14: UILabel!
    @IBOutlet weak var labelNum15: UILabel!
    @IBOutlet weak var labelNum16: UILabel!
    @IBOutlet weak var txtFieldNumber: UITextField!
    
    //MARK: Propriedades
    let address = URL(string: "https://k9h52hczu2.execute-api.us-east-2.amazonaws.com/prod/random_array_generator")
    var arrayData : [Int] = []
    var indicator : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        txtFieldNumber.text = ""
        refreshArray()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 243, green: 243, blue: 243, alpha: 1)
        view.backgroundColor = UIColor(displayP3Red: 243, green: 243, blue: 243, alpha: 1)
        
    }

    //MARK: Actions
    @IBAction func btnverify(_ sender: UIButton) {
    
        if !(txtFieldNumber.text!.isEmpty){
            
            indicator = 0
            
            for firstNumber in arrayData {
                
                for secondNumber in arrayData{
                    
                    if firstNumber != secondNumber{
                        
                        if firstNumber + secondNumber == Int(txtFieldNumber.text!){
                            
                            //valor correto
                            print("Deu certo \(firstNumber) \(secondNumber)")
                            
                            historyVerification(with: txtFieldNumber.text!, arrayData: arrayData, status: "Existe")
                            indicator = 1
                            
                            showToast(message: "existe")
                            txtFieldNumber.text = ""
                            
                            return
                        }
                    }
                }
            }
        } else {
            
            alert(message: "Preencha o campo de número corretamente")
            
        }
        
        if indicator != 1 {
            
         historyVerification(with: txtFieldNumber.text!, arrayData: arrayData, status: "Não existe")
            showToast(message: "não existe")
            
        }
        
        txtFieldNumber.text = ""
    
    }
    
    @IBAction func RefreshList(_ sender: UIButton) {
        
        refreshArray()
        txtFieldNumber.text = ""
    
    }
    
    //MARK: Métodos Próprios
    func refreshArray() {
        
        if ReachabilityTest.isConnectedToNetwork(){
        
            labelNum1.text = ""
            labelNum2.text = ""
            labelNum3.text = ""
            labelNum4.text = ""
            labelNum5.text = ""
            labelNum6.text = ""
            labelNum7.text = ""
            labelNum8.text = ""
            labelNum9.text = ""
            labelNum10.text = ""
            labelNum11.text = ""
            labelNum12.text = ""
            labelNum13.text = ""
            labelNum14.text = ""
            labelNum15.text = ""
            labelNum16.text = ""
        
            do {
                
                let jsonData = try Data(contentsOf: address!)

                arrayData = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as! [Int]
            
                labelNum1.text = String(arrayData[0])
                labelNum2.text = String(arrayData[1])
                labelNum3.text = String(arrayData[2])
                labelNum4.text = String(arrayData[3])
                labelNum5.text = String(arrayData[4])
                labelNum6.text = String(arrayData[5])
                labelNum7.text = String(arrayData[6])
                labelNum8.text = String(arrayData[7])
                labelNum9.text = String(arrayData[8])
                labelNum10.text = String(arrayData[9])
                labelNum11.text = String(arrayData[10])
                labelNum12.text = String(arrayData[11])
                labelNum13.text = String(arrayData[12])
                labelNum14.text = String(arrayData[13])
                labelNum15.text = String(arrayData[14])
                labelNum16.text = String(arrayData[15])
            
            } catch {

                alert(message: "Verifique a conexão com a Internet")
            }
        } else {
            
            alert(message: "Verifique a conexão com a Internet")
        }
    }
    
    func alert(message : String) {
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(actionOK)
        
        present(alert, animated: true, completion: nil)

    }
    
    fileprivate func historyVerification(with numberTyped : String, arrayData : [Int], status : String){
        
        arrayHistoric.append(["numeroDigitado" : numberTyped,"arrayDados": arrayData,"status" : status])
    }
  
    //MARK: Métodos de UIResponder
    override var canBecomeFirstResponder: Bool{
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.becomeFirstResponder()
        
    }
    
}

extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.0, options: .curveEaseIn, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}




