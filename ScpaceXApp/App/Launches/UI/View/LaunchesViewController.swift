//
//  LaunchesViewController.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import UIKit
import RxSwift
import RxCocoa

final class LaunchesViewController: UIViewController, UITableViewDelegate {
    
    private enum Constants {
        static let kCellHeight: CGFloat = 200
    }
    
    @IBOutlet private weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    private let inputAndOutput: LaunchesViewInputAndOutputProtocol
    
    init(presenter: LaunchesViewInputAndOutputProtocol) {
        self.inputAndOutput = presenter
        super.init(nibName: String(describing: LaunchesViewController.self),
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        inputAndOutput.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupUI() {
        self.view.backgroundColor = .black
        setupNavigationBarUI()
        navigationItem.title = LaunchesLocalizable.launchesTitle.localized()
        setupTableView()
        bindData()
    }
    
    private func setupTableView() {
        self.tableView.backgroundColor = .clear
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: LaunchCell.reuseIdentifier,
                                      bundle: nil),
                                forCellReuseIdentifier: LaunchCell.reuseIdentifier)
    }
    
    private func bindData() {
        inputAndOutput.launches
            .bind(to: tableView.rx.items) {[weak self] table, row, item -> UITableViewCell in
                guard let self = self,
                      let launchCell = self.getCell(table: table, type: LaunchCell.self)
                else { return UITableViewCell() }
                launchCell.setup(with: item)
                return launchCell
            }.disposed(by: disposeBag)
    }
    
    private func getCell<T: UITableViewCell>(table: UITableView, type: T.Type) -> T? {
        table.dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T
    }
    
    //MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.kCellHeight
    }
}
