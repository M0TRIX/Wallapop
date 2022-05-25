//
//  LandingViewController.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import UIKit

class CharactersViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    var viewModel:CharactersViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight  = UITableView.automaticDimension

        viewModel = CharactersViewModel(serviceApi: ServiceApi(), controller: self)
        viewModel?.getAllCharacters(completion: { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }

}

extension CharactersViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterIdentifier", for: indexPath) as! CharacterTableViewCell
        cell.bind(object: viewModel?.movieList[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.movieList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CharDetailViewController.createInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
