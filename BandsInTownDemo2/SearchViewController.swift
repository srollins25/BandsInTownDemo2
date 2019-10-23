//
//  SearchViewController.swift
//  BandsInTownDemo2
//
//  Created by stephan rollins on 10/21/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class SearchViewController: UIViewController {
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    var artistArr = [Artist]()
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //createArr()
        execute(URL(string: "https://rest.bandsintown.com/artists/LilWayne?app_id=test")!, completion: { (json, error) in
            if let error = error {
                print(error.localizedDescription)
            }
                
            else if let json = json {
                print(json.description)
            }
        }  )
    }
    
    
    func createArr() {
        var i = 0
        while (i < 10)
        {
            let artist = Artist()
            artist.id = i.description
            //artist.artistImage = "test"
            //artist.name = "test" + String(i)
            artist.upcoming_event_count = i as NSNumber
            artistArr.append(artist)
            i = i + 1
        }
    }
    
    func execute(_ url: URL, completion: @escaping WebServiceResponse)
    {
        Alamofire.request(url, headers: ["x-api-key": "EJqbBuarkq7bNqBZgNnaA6hPG5b0HzAY1q6CBAF4"]).responseJSON(completionHandler: { response in
            
            if let error = response.error {
                completion(nil, error)
            }
                
            else if let jsonArr = response.result.value as? [[String: Any]]
            {
                completion(jsonArr, nil)
            }
                
            else if let jsonDictionary = response.result.value as? [String: Any]
            {
                let artist = Artist()
                artist.id = (jsonDictionary["id"] as! String)
                artist.name = (jsonDictionary["name"] as! String)
                artist.image_url = (jsonDictionary["image_url"] as! String)
//                Alamofire.download(artist.image_url!).responseData { response in
//                    if let data = response.value {
//                        artist.artistImage = UIImage(data: data)
//                        print("test image: ", UIImage(data: data))
//                        print("***********************************************************************")
//                    }
//                }
                artist.upcoming_event_count = (jsonDictionary["upcoming_event_count"] as! NSNumber)
                self.artistArr.append(artist)
                print("arr count: ", self.artistArr.count)
                print("id test: ", artist.id!)
                print("name test: ", artist.name!)
                //print(artist.artistImage!)
                print("upcoming_event_count test: ", artist.upcoming_event_count!)
                completion([jsonDictionary], nil)
                
            }
        })
    }
    

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate
{
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "custom") as! ArtistCell
        cell.imageView?.image  = UIImage(named: "frank-cho-spider-man")
        print(artistArr[0].name as Any)
        cell.textLabel?.text = artistArr[0].name//artistArr[indexPath.row].name
        //cell.imageView?.image = artistArr[indexPath.row].artistImage

        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = self.artistArr[indexPath.row]
        print(artist)
        
        //let vc = ArtistViewController()
        //vc.artist = artist
    //self.navigationController?.pushViewController(ViewController, animated: true)
    }
}


