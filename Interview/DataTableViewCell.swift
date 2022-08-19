//
//  DataTableViewCell.swift
//  Interview
//
//  Created by 劉晉賢 on 2022/8/19.
//
import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    private var viewModel: DataTableViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "DataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DataCollectionViewCell")
    }
    
    func setCell(viewModel: DataTableViewModel) {
        self.viewModel = viewModel
        viewModel.setImage = { [weak self] image in
            self?.picture.image = image
        }
        
        self.name.text = viewModel.model?.user?.nickName ?? ""
        viewModel.setImageView()
    }
    
    private func textSize(text: String, font: UIFont, maxSize: CGSize) -> CGSize {
        
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
}

extension DataTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.setNumberOfItemsInSection() ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as! DataCollectionViewCell
        cell.setCell(viewModel: (viewModel?.dataCollectionViewModels[indexPath.row])!)
        return cell
    }
}

extension DataTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let textFont = UIFont.init(name: "PingFang-TC-Regular", size: 15)!
        let textString = viewModel?.model?.tags?[indexPath.row]
        let textMaxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 32)
        let textLabelSize = textSize(text: textString ?? "", font: textFont, maxSize: textMaxSize)
        
        return CGSize(width: textLabelSize.width + 10, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
    
}

