//
//  CharDetailViewController.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/4/1401 AP.
//

import UIKit

class CharDetailViewController: UIViewController {

    @IBOutlet weak var comicCollectionView:UICollectionView!
    @IBOutlet weak var seriesCollectionVIew: UICollectionView!
    @IBOutlet weak var storiesCollectionView:UICollectionView!
    
    var result:Result?
    var CharDetailViewModel:CharactersDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = result?.name
        
        CharDetailViewModel = CharactersDetailViewModel(serviceApi: ServiceApi(), controller: self,comicList: [], seriesList: [], storiesList: [])
        
        getAllComics()
        getAllSeries()
        getAllStories()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
   
    func getAllComics(){
        CharDetailViewModel?.getAllComics(comicCollectionUrl: result?.comic.collectionURI ?? "", completion: { [weak self] _ in
            DispatchQueue.main.async {
                self?.comicCollectionView.reloadData()
            }
        })
    }
    
    func getAllSeries(){
        CharDetailViewModel?.getAllSeries(serieCollectionUrl: result?.series.collectionURI ?? "", completion: { [weak self] _ in
            DispatchQueue.main.async {
                self?.seriesCollectionVIew.reloadData()
            }
        })
    }
    
    func getAllStories(){
        CharDetailViewModel?.getAllStories(storyCollectionUrl: result?.story.collectionURI ?? "", completion: { [weak self] _ in
            DispatchQueue.main.async {
                self?.storiesCollectionView.reloadData()
            }
        })
    }
}

extension CharDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == comicCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "comicListIdentifier", for: indexPath) as! ComicCollectionViewCell
            cell.bind(object: CharDetailViewModel?.comicList?[indexPath.row] ?? "")
            return cell
        }else if collectionView == seriesCollectionVIew{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seriesListIdentifier", for: indexPath) as! SeriesCollectionViewCell
            cell.bind(object: CharDetailViewModel?.seriesList?[indexPath.row] ?? "")
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storiesListIdentifier", for: indexPath) as! StoriesCollectionViewCell
            cell.bind(object: CharDetailViewModel?.storiesList?[indexPath.row] ?? "")
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == comicCollectionView {
            return CharDetailViewModel?.comicList?.count ?? 0
        }else if collectionView == seriesCollectionVIew {
            return CharDetailViewModel?.seriesList?.count ?? 0
        }else{
            return CharDetailViewModel?.storiesList?.count ?? 0
        }
    }
}
