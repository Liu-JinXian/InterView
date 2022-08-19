//
//  ViewController.swift
//  Interview
//
//  Created by 劉晉賢 on 2022/8/19.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewModel()
        setTableView()
        viewModel?.getList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = ""
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .gray
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.setNumberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
        cell.setCell(viewModel: (viewModel?.dataTableViewModels[indexPath.row])!)
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        cell.collectionView.reloadData()
        cell.collectionHeight.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
        return cell
    }
}

extension ViewController {
    private func setViewModel() {
        viewModel = ViewModel()
        viewModel?.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel?.setTitle = { [weak self] title in
            self?.navigationItem.title = "totalCount\(title)"
        }
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
    }
}

