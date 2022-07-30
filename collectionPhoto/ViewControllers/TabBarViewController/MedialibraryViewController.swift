//
//  MedialibraryViewController.swift
//  collectionPhoto
//
//  Created by Роман Назаров on 30.07.2022.
//

import UIKit

class MedialibraryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Медиатека"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
