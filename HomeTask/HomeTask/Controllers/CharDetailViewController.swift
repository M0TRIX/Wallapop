//
//  CharDetailViewController.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/4/1401 AP.
//

import UIKit

class CharDetailViewController: UIViewController {

    static func createInstance()->CharDetailViewController{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CharDetailViewController") as! CharDetailViewController
        return newViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
}
