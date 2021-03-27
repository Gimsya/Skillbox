//
//  VCWeatherCell.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/27/21.
//

import UIKit

class VCWeatherCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
