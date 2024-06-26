//
//  HackerNewsTableViewCell.swift
//  HackerNews
//
//  Created by Disha patel on 6/25/24.
//

import UIKit

class HackerNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(newsInfo: Hit){
        titleLabel.text = newsInfo.title
        artistNameLabel.text = newsInfo.author
        pointsLabel.text = "\(newsInfo.points ?? 00)"
        commentsLabel.text = "\(newsInfo.comments ?? 00)"
    }

}
