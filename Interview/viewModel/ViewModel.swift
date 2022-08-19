//
//  ViewModel.swift
//  Interview
//
//  Created by 劉晉賢 on 2022/8/19.
//
import ObjectMapper
import Alamofire

class ViewModel {
    
    var reloadData: (() -> ())?
    var setTitle: ((String) -> ())?
    var dataTableViewModels: [DataTableViewModel] = []
    
    private var testModel: TestModel?
    
    func getList() {
        let address = "https://raw.githubusercontent.com/winwiniosapp/interview/main/interview.json"
        Alamofire.request(address, method: .get).responseJSON { response in
            self.testModel = Mapper<TestModel>().map(JSONObject: response.result.value)
            self.setDataViewModel()
            self.setTitle?("\(self.testModel?.data?.totalCount ?? 0)")
            self.reloadData?()
        }
    }
    
    func setNumberOfRowsInSection() -> Int {
        return self.testModel?.data?.items?.count ?? 0
    }
}

extension ViewModel {
    private func setDataViewModel() {
        
        self.dataTableViewModels = []
        
        self.testModel?.data?.items?.forEach{ (item) in
            let viewModel = DataTableViewModel()
            viewModel.setViewModel(model: item)
            self.dataTableViewModels.append(viewModel)
        }
    }
}

