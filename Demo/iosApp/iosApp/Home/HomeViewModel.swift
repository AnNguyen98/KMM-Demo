//
//  HomeViewModel.swift
//  MoviesTrailer
//
//  Created by An Nguyen 2 on 8/29/21.
//

import Combine
import shared

final class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var isLastRow: Bool = false
    
    var currentPage: Int = 1
    var totalPage: Int = 1
    
    var canLoadMore: Bool {
        isLastRow && currentPage < totalPage
    }
    
    func checkingForLoadmore(_ item: Movie) {
        isLastRow = item.id == movies.last?.id
        if canLoadMore, !isLoading {
            getMovies(page: currentPage + 1)
        }
    }
    
    func getMovies(page: Int = 1) {
        isLoading = true
        print("DEBUG - Getting movies at page \(page)")
        MovesRepository().getMovies(page: Int32(page)) { response, error in
            self.isLoading = false
            if let res = response {
                if res.page > 1 {
                    self.movies.append(contentsOf: res.movies)
                } else {
                    self.movies = res.movies
                }
                self.currentPage = Int(res.page)
                self.totalPage = Int(res.totalPage)
            } else {
                print("DEBUG - ERROR: ", error?.localizedDescription ?? "Unknow")
            }
        }
    }
    
    func setupData() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.getMovies()
        }
    }
    
    func refreshData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.movies.removeAll()
            self.setupData()
        }
    }
}


//
extension Movie: Identifiable { }
