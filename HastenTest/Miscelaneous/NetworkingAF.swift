//
//  NetworkingAF.swift
//  HastenTest
//
//  Created by Leonardo Puga-DeBiase on 24/12/2018.
//  Copyright © 2018 Leonardo Puga-DeBiase. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingAF: NSObject {
    let getAllSportsPlayersURL: String = "https://api.myjson.com/bins/66851"
    static let shared = NetworkingAF()
    override init() {}
    
    func getInfoFromURL()->Any{
        var result:Any!
        /*guard let url = URL(string: getAllSportsPlayersURL) else {
            print("Error with the URL")
            return result
        }
        Alamofire.request(url,
                          method: .get)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: (String(describing:response.result.error)")
                    return
                }
            
                guard let value = response.result.value as? [String: Any],
                    let rows = value["rows"] as? [[String: Any]] else {
                        print("Malformed data received from fetchAllRooms service")
                        return
                    }
                result = value
            }*/
        
        
        Alamofire.request(getAllSportsPlayersURL).responseJSON { response in
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                //print("JSON: \(json)") // serialized json response
                result = json //response.result.value as! [String: Any]
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                //print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
        
        
        return result
    }
}
