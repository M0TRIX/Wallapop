//
//  LandingViewController.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel:CharactersViewModel?
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight  = UITableView.automaticDimension
        
        viewModel = CharactersViewModel(serviceApi: ServiceApi(), controller: self,movieList:[],filteredListOfChars: [])
        getAllCharacters()
    }
    
    func getAllCharacters(){
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
        cell.bind(object: viewModel?.filteredListOfChars?[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.filteredListOfChars?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let value = viewModel?.filteredListOfChars?[indexPath.row] {
            self.createInstance(filteredObject: value)
        }
    }
}

extension CharactersViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.viewModel?.filteringData(searchText: searchText, compilition: { [weak self] in
            self?.tableView.reloadData()
        })
    }
}

extension CharactersViewController: UIViewControllerTransitioningDelegate,UINavigationControllerDelegate {
    
    func createInstance(filteredObject:Result){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CharDetailViewController") as! CharDetailViewController
        newViewController.modalPresentationStyle = .custom
        newViewController.transitioningDelegate = self
        newViewController.result = filteredObject
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = self.view.center
        transition.circleColor = self.view.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = self.view.center
        transition.circleColor = self.view.backgroundColor!
        return transition
    }
}
