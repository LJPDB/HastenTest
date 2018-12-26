//
//  Tableview_SportPlayers_List.swift
//  HastenTest
//
//  Created by Leonardo Puga-DeBiase on 08/12/2018.
//  Copyright © 2018 Leonardo Puga-DeBiase. All rights reserved.
//

import UIKit
import Alamofire

class Tableview_SportPlayers_List: UIViewController {
    @IBOutlet weak var ol_tableView: UITableView!
    //var getInfoFromURL:[String:Any]?
    let getAllSportsPlayersURL: String = "https://api.myjson.com/bins/66851"
    var currentSect: Int!
    var sportPlayersList:[Dictionary<String,AnyObject>]?{
        didSet{
            print("JSON: \(String(describing: getInfoFromURL))")
        }
    }
    var PlayerList: [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.register(CustomCell.self, forCellReuseIdentifier:"")
        ol_tableView.delegate = self
        ol_tableView.dataSource = self
        
       // let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //getInfoFromURL = appDelegate.NW_AF_Singleton?.getInfoFromURL()
        getInfoFromURL()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getInfoFromURL()->Void{
        Alamofire.request(getAllSportsPlayersURL).responseJSON { response in
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                //print("JSON: \(json)") // serialized json response
                if let auxResult = json as? [Dictionary<String,AnyObject>] {
                    self.sportPlayersList = auxResult
                    self.resetTableView()
                }//response.result.value as! [String: Any]
                print("Parsed to Dic: \(String(describing: self.sportPlayersList))")
                
            }
        }
    }
 
    
}

extension Tableview_SportPlayers_List: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseDynCell") as! CustomCell_PlayerInfoCell //1.
        
        let players: [Dictionary<String,String>] = self.sportPlayersList?[indexPath.section]["players"] as! [Dictionary<String,String>]
        //print("player: \(self.sportPlayersList?[self.currentSect]["players"])")
        //print("\(players[indexPath.row])")
        cell.setPlayerInfo(player: players[indexPath.row])
        
        return cell //4.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
         return self.sportPlayersList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let players = self.sportPlayersList?[section]["players"]{
            self.currentSect = section
            return players.count
        }else{
            return 0
        }
       // return self.sportPlayersList.players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (self.sportPlayersList?[section]["title"] as! String)
    }
    
    func resetTableView(){
        self.ol_tableView.reloadData()
        //self.refresher.endRefreshing()
    }
}
