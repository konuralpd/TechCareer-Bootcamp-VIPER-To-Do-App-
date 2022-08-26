//
//  ToDoCell.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var toDoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
