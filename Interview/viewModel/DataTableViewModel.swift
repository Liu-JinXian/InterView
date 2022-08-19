//
//  DataTableViewModel.swift
//  Interview
//
//  Created by 劉晉賢 on 2022/8/19.
//
import SDWebImage
import UIKit

class DataTableViewModel {
    
    var model: ItemModel?
    var dataCollectionViewModels: [DataCollectionViewModel] = []
    
    var setImage: ((UIImage) -> ())?
    
    func setViewModel(model: ItemModel) {
        self.model = model
        self.setCollectionViewModel()
    }
    
    func setImageView() {
        if let picUrl = model?.user?.imageUrl {
            SDWebImageManager.shared.loadImage(with: URL(string: picUrl), options: SDWebImageOptions.retryFailed, progress: nil, completed: { (image, data, error, cacheType, bool, imageURL) in
                self.setImage?(image ?? UIImage())
            })
        }
    }
    
    func setNumberOfItemsInSection() -> Int {
        return self.dataCollectionViewModels.count
    }
    
    func setCollectionViewModel() {
        model?.tags?.forEach{ (tag) in
            let viewModel = DataCollectionViewModel()
            viewModel.setViewModel(tag: tag)
            dataCollectionViewModels.append(viewModel)
        }
    }
}
