//
//  DataViewController.swift
//  MuseoApp
//
//  Created by Juan David Cruz Serrano on 5/9/17.
//  Copyright © 2017 Dhamova. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    
    var dataObject: String = ""
    var dataImageName: String = ""
    var dataDescription: String = ""
    var dataLearnMore: String = ""
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func GoToLearnMore(_ sender: Any) {
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
        self.imageView.image = UIImage(named:dataImageName)
        self.descriptionView.text = dataDescription
    }


}

