//
//  DetailViewController.swift
//  contactApp
//
//  Created by slava on 28.07.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        numberLabel.text = person.number
        emailLabel.text = person.email
    }
}
