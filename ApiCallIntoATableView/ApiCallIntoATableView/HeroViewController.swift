//
//  HeroViewController.swift
//  ApiCallIntoATableView
//
//  Created by Sainath Bamen on 16/05/23.
//

import UIKit

class HeroViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var legslbl: UILabel!
    
    @IBOutlet weak var heroImg: UIImageView!
    var hero:HeroStats?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = hero?.localized_name
        attributeLbl.text = hero?.primary_attr
        attackLbl.text = hero?.attack_type
        legslbl.text = "\((hero?.legs)!)"
        

        
    }
    

}
