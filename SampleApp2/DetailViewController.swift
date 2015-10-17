//
//  DetailViewController.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var petDetail: Pet? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let pet = self.petDetail {
            if let label = self.detailDescriptionLabel {
                label.text = pet.Name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

