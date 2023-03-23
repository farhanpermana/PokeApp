//
//  ViewController.swift
//  PokeApp
//
//  Created by Farhan on 15/03/23.
//

import UIKit
import SDWebImage

class PokeListViewController: UIViewController, moveToPokemonDetail {
    
    static let identifier = "PokeListViewController"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: moveToPokemonDetail?
    
    var pokeListViewModel: PokeListViewModel?
    var moveToPokemonDetailDelegate: moveToPokemonDetail?
    
    private var listPoke: PokeModel?
    
    private var listResult: [ResultModel]?
    private var pokeDatas: [PokeModel]? = []
    
    private var data: PokeModel?
    
    func setupLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: 300, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        layout.minimumInteritemSpacing = 12
        let screenSize = self.view.bounds.size.width - layout.sectionInset.left -
        layout.sectionInset.right - layout.minimumInteritemSpacing
        layout.itemSize = CGSize(width: screenSize / 2, height: 180)
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
      return layout
    }
    
    func registerCollection() {
        collectionView.collectionViewLayout = setupLayout()
        collectionView.register(UINib(nibName: "PokeListCollectionCell", bundle: nil), forCellWithReuseIdentifier: PokeListCollectionCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollection()
        setupPokeApi()
        
        delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        title = "Pokemon List"
    
    
    }
    // unused transition func (maybe)
    func moveToDetailPokemon(model: ResultModel) {
        let vc = PokeDetailController()
        vc.listPoke = model
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension PokeListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = listPoke?.results.count ?? 0
        print("count:", count)
        return count
        
    }
    
    func setupPokeApi() {
        self.pokeListViewModel = PokeListViewModel(urlString: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=100", apiService: ApiService())
        
        self.pokeListViewModel?.bindPokeData = { listModel in
            if let listData = listModel {
                self.listPoke = listData
                print("bind", self.listPoke?.results.count ?? 0)
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
        cell.imgView.sd_setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(indexPath.row + 1).png"))
        //        cell.setupData(model: listPoke)
        //        cell.moveToPokemonDetailDelegate = self.delegate
        self.moveToPokemonDetailDelegate?.moveToDetailPokemon(model: listPoke?.results[indexPath.row] ?? ResultModel(name: "", url: ""))
        return cell
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        let count = self.listPoke?.results.count ?? 0
//        print("count ", count
//        )
//        return count
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pokemon = self.listPoke?.results[indexPath.row],
           let pokemonDetailVC = storyboard.instantiateViewController(withIdentifier: PokeDetailController.identifier) as? PokeDetailController {
            
            pokemonDetailVC.listPoke = pokemon
            self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
        }
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
    

