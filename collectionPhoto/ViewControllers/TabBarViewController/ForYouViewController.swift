//
//  ForYouViewController.swift
//  collectionPhoto
//
//  Created by Роман Назаров on 30.07.2022.
//

import UIKit

class ForYouViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Для Вас"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
