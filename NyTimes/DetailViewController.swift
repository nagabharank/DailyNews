//
//  DetailViewController.swift
//  NyTimes
//
//  Created by NagaBharan Kothrui on 11/18/17.
//  Copyright © 2017 Karthik Muppala. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var articleDetails: UILabel!
    
    var newsData:NewsData?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(newsData)
        articleDetails.text = newsData?.summary


    }

    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
