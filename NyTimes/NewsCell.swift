//
//  NewsCell.swift
//  NyTimes
//
//  Created by Karthik Muppala on 11/17/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsStory: UILabel!
    @IBOutlet weak var newsHeadline: UILabel!
    @IBOutlet weak var newsDisplayTitle: UILabel!
    
    func configureCell(newsItem: NewsData) {
        DispatchQueue.main.async {
            self.newsStory.text = newsItem.summary
            self.newsHeadline.text = newsItem.headline
            self.newsDisplayTitle.text = newsItem.displayTitle
        }
    }
}
