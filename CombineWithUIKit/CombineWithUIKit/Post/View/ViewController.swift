//
//  ViewController.swift
//  CombineWithUIKit
//
//  Created by Parvendra Kumar on 24/08/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet private weak var listTbl: UITableView!
    let postVM: PostViewModel = PostViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurTableView()
    }
}

extension ViewController : UITableViewDataSource {
    
    func configurTableView (){
        self.listTbl.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.listTbl.dataSource = self
        postVM.getPostData()
        bindViewModel()
    }
    
    private func bindViewModel() {
        postVM.$postDataArray
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.listTbl.reloadData()
            }
            .store(in: &cancellables)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postVM.postDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            fatalError()
        }
        cell.setDataOnCell(_cellData: postVM.postDataArray[indexPath.row])
        return cell
    }
}

