//
//  ContainerViewController.swift
//  BandsInTownDemo2
//
//  Created by stephan rollins on 10/22/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var favoritesView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeView(_ sender: UISegmentedControl)
    {
        if(sender.selectedSegmentIndex == 0)
        {
            searchView.alpha = 1
            favoritesView.alpha = 0
        }
        else if(sender.selectedSegmentIndex == 1)
        {
            searchView.alpha = 0
            favoritesView.alpha = 1
        }
    }

}
