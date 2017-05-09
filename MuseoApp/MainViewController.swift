//
//  MainViewController.swift
//  MuseoApp
//
//  Created by Juan David Cruz Serrano on 5/9/17.
//  Copyright © 2017 Dhamova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notSupported(_ sender: Any) {
        
        let alert = UIAlertController(title: "Sala No Disponible", message: "Esta sala no se encuentra disponible en este momento. Esperala pronto!", preferredStyle: .alert)
        
        let actionClose = UIAlertAction(title: "Cerrar", style: .default) { (action:UIAlertAction) in
            
        }
        
        alert.addAction(actionClose)
        
        self.present(alert, animated: true) { 
            
        }
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
