//
//  NYTimesViewController.swift
//  NyTimes
//
//  Created by Karthik Muppala on 11/17/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import UIKit

class NYTimesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var newsResults = [NewsData]()
    var selectedNewsData:NewsData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webserviceCall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webserviceCall() {
        let urlString = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?api-key=eafbbac18ab84e12a5f3f2e0dd1dece3"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            if error != nil{
                print(error.debugDescription)
            }else{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? Dictionary<String, Any>{
                        self.parseJson(json: json)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }catch{
                    print("error converting json")
                }
            }
        })
        task.resume()
    }
    
    func parseJson(json: Dictionary<String, Any>) {
        print()
        if let newsItems = json["results"] as? [Dictionary<String, Any>] {
            for item in newsItems{
                let newsItem = NewsData(newsItem: item)
                self.newsResults.append(newsItem)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedNewsData = self.newsResults[indexPath.row]
        self.performSegue(withIdentifier: "detail", sender: self)
    }
    
    
    //Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell{
            cell.configureCell(newsItem: newsResults[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetailViewController
        dest.newsData = self.selectedNewsData
        
    }
    

}
