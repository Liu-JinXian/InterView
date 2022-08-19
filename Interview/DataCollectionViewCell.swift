//
//  DataCollectionViewCell.swift
//  Interview
//
//  Created by 劉晉賢 on 2022/8/19.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    
    func setCell(viewModel: DataCollectionViewModel) {
        self.tagLabel.text = viewModel.tag ?? ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
