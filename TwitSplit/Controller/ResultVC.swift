//
//  DetailViewController.swift
//  TwitSplit
//
//  Created by user on 25/8/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    var content = [String]()
    @IBOutlet weak var tv_content: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tv_content.text =  content.joined(separator: "\n");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}




