//
//  MoviesViewController.swift
//  MovieAPI
//
//  Created by Coti on 14/09/2021.
//

import UIKit

class MoviesViewController: UIViewController {
    

  
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MovieViewModel()
    var movie: Movie?
    var page = 1
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "moviecell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        viewModel.loadPopularMovies(page: page)
        bind()
        
    }
    private func bind() {
        isLoading = true
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.isLoading = false
            }
        }
    }
}
    
// TableView

extension MoviesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(at: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell") as! MovieTableViewCell
        let result = viewModel.item(at: indexPath)
        cell.configure(for: result)
        return cell

    }
}

extension MoviesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.results.count - 5 {
            guard !isLoading else {
                return
            }
        }
        page += 1
        viewModel.loadPopularMovies(page: page)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedResults = viewModel.results[indexPath.row]
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        viewController.movie = selectedResults
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRow(at: indexPath))
    }
}
