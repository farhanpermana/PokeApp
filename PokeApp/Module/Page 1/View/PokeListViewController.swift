//
//  ViewController.swift
//  PokeApp
//
//  Created by Farhan on 15/03/23.
//

import UIKit
import SDWebImage

class PokeListViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var pokeListViewModel: PokeListViewModel?
    
    private var listPoke: PokeModel?
    private var listResult: [ResultModel]?
    
    private var data: PokeModel?
    
    func setupTable() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 300, height: 200)
        
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.register(UINib(nibName: "PokeListCollectionCell", bundle: nil), forCellWithReuseIdentifier: PokeListCollectionCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupTable()
        setupPokeApi()
    }


}

extension PokeListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listPoke?.results.count ?? 0
    }
    
    func setupPokeApi() {
            self.pokeListViewModel = PokeListViewModel(urlString: "https://pokeapi.co/api/v2/pokemon", apiService: ApiService())
    
            self.pokeListViewModel?.bindPokeData = { listModel in
                if let listData = listModel {
                    self.listPoke = listData
                    self.collectionView.backgroundColor = .white
                } else {
                    self.collectionView.backgroundColor = .red
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeListCollectionCell.identifier, for: indexPath) as? PokeListCollectionCell else { return UICollectionViewCell()}
        cell.titleLabel.text = self.listPoke?.results[indexPath.row].name
        cell.imgView.sd_setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row + 1).png"))
//        cell.setupData(model: listPoke)

                return cell
            }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = self.listPoke?.results.count ?? 0
                print("count ", count
                )
                return count
    }
}
    
    


//extension PokeListViewController: UITableViewDelegate, UITableViewDataSource {
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokeListCollectionCell.identifier, for: indexPath) as? PokeListCollectionCell else {
//            return UITableViewCell() }
//        cell.setupTable()
//        return cell
//    }
//
//}

