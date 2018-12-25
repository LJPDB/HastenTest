//
//  CustomCell_TblVCellTableViewCell.swift
//  HastenTest
//
//  Created by Leonardo Puga-DeBiase on 22/12/2018.
//  Copyright © 2018 Leonardo Puga-DeBiase. All rights reserved.
//

import UIKit
import SDWebImage

class CustomCell_PlayerInfoCell: UITableViewCell {
    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_bday: UILabel!
    let defaultValueSurname: String = "Surname"
    let defaultValueName: String = "Name"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPlayerInfo(player: Dictionary<String,String>){
        //imageThumb.image = player["image"]        
        //let data = try? Data(contentsOf: url ?? (FileManager().urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("NoUserImg"))!)
        print("Image URL: \(String(describing: player["image"]!))")
        imageThumb.sd_setImage(with: URL(string: player["image"]!), placeholderImage: UIImage(named: "NoUserImg"))
        
       /*
         if let imageData = data {
            imageThumb.image = UIImage(data: imageData)
        }else{
            imageThumb.image = UIImage(named: "NoUserImg")
        }
 */
        lbl_name.text = "\(player["name"] ?? defaultValueName) \(player["surname"] ?? defaultValueSurname)"
        lbl_bday.text = player["date"]
    }

}
