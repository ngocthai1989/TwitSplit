//
//  ViewController.swift
//  TwitSplit
//
//  Created by user on 24/8/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class InputVC: UIViewController {
    let MAX_SPLIT_MESSAGE = 50
    @IBOutlet weak var tv_content: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customBoderTextView(textview: self.tv_content)
        self.tv_content .becomeFirstResponder()
    }
    
    
    
    @IBAction func ac_split(_ sender: Any) {
        if !self.tv_content.text.isEmpty
        {
            let message =  Utils.splitMessage(message: self.tv_content.text, limit: MAX_SPLIT_MESSAGE)
            if message.isEmpty
            {
                let alert = UIAlertController(title: "Error", message: "the message contains a span of non-whitespace characters longer than \(MAX_SPLIT_MESSAGE) characters", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                let detailView = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultVC") as? ResultVC
                detailView?.content = message;
                self.navigationController?.pushViewController(detailView!, animated: true)
            }
        }
    }
    
    
    
    func customBoderTextView(textview : UITextView){
        textview.layer.cornerRadius=5;
        textview.layer.borderWidth = 1.0;
        textview.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}







