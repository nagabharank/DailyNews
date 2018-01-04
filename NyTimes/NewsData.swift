//
//  NewsData.swift
//  NyTimes
//
//  Created by Karthik Muppala on 11/17/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import Foundation


class NewsData {
    
    private var _displayTitle: String!
    private var _rating: String!
    private var _headline: String!
    private var _summary: String!
    private var _imageUrl: String!
    private var _publicationDate: String!
    
    var displayTitle: String{
        if _displayTitle == nil{
            _displayTitle = ""
        }
        return _displayTitle
    }
    var rating: String{
        if _rating == nil{
            _rating = ""
        }
        return _rating
    }
    var headline: String{
        if _headline == nil{
            _headline = ""
        }
        return _headline
    }
    var summary: String{
        if _summary == nil{
            _summary = ""
        }
        return _summary
    }
    var imageUrl: String{
        if _imageUrl == nil{
            _imageUrl = ""
        }
        return _imageUrl
    }
    var publicationDate: String{
        if _publicationDate == nil{
            _publicationDate = ""
        }
        return _publicationDate
    }
    
    init(newsItem: Dictionary<String, Any>) {
        if let displayTitle = newsItem["display_title"]  as? String{
            self._displayTitle = displayTitle
        }
        if let headline = newsItem["headline"] as? String{
            self._headline = headline
        }
        if let summary = newsItem["summary_short"] as? String{
            self._summary = summary
        }
    }
    

}
