//
//  WeatherTableViewCell.swift
//  SkillBox_12
//
//  Created by Sergey Chudarin on 13.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var temperatureMid: UILabel!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var temperatureMin: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var forecastDay: UILabel!
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
