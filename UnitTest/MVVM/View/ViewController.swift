//
//  ViewController.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let loader = LoaderView()
    private var errorView: ErrorView?
    var branchesViewModel: ProductViewModel = ProductViewModel()
    private let disposeBag = DisposeBag()
    var branchesModel = [Datum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    private func setUpUI() {
        bindLoaderState()
        setUpBinding()
        setUpUTableViewDataSource()
    }
    override func viewWillAppear(_ animated: Bool) {
        getBranches()
    }
    
    private func showLoader() {
        tableView.addSubview(loader)
        loader.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
        loader.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        loader.startAnimating()
    }
    
    private func hideLoader() {
        loader.removeFromSuperview()
        loader.stopAnimating()
    }
    
    private func bindLoaderState() {
        branchesViewModel.loaderSate.asObservable().subscribe(onNext: {
            [unowned self] state in
            switch state {
            case .shown: self.showLoader()
            case .hidden: self.hideLoader()
            }
        }).disposed(by: disposeBag)
    }
    
    func setUpBinding() {
        branchesViewModel.branchesModelSubject.subscribe(onNext: { [weak self] model in
            self?.branchesModel = model
        }).disposed(by: disposeBag)
        
    }
    
    func setUpUTableViewDataSource() {
        branchesViewModel.branchesModelSubject
            .bind(to: tableView.rx.items(cellIdentifier: "ProductTableViewCell", cellType: ProductTableViewCell.self)) { row, model, cell in
                cell.titletext.text = model.name
                cell.reloadImage(image:model)
            }.disposed(by: disposeBag)
    }
    
    func getBranches() {
        branchesViewModel.showCatrogy()
    }
    
}
