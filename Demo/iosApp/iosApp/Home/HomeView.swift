//
//  ContentView.swift
//  Shared
//
//  Created by An Nguyen 2 on 8/29/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State var searchText: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                VStack {
                    buildListMovies()
                        .navigationBarTitle(Text("Movies"))
                        .toolbar(content: {
                            ToolbarItem(placement: .navigationBarTrailing, content: {
                                Button(action: {
                                    isLoggedIn.toggle()
                                }, label: {
                                    Text("Logout")
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                        .font(.caption.bold())
                                })
                                    .font(.system(size: 16).bold())
                            })
                        })
                    
//                    if viewModel.isLoading, viewModel.canLoadMore {
//                        ProgressView()
//                    }
                }
            } else {
                // Fallback on earlier versions
                Text("Please upgrade to iOS 15!")
                    .foregroundColor(.red)
                    .font(.body.italic())
            }
        }
        .handleLoadingView($viewModel.isLoading)
        .onAppear {
            viewModel.setupData()
        }
    }
    
    private func buildListMovies() -> some View {
        List(viewModel.movies) { movieItem in
            MovieView(movie: movieItem)
//                .listRowSeparator(.hidden)
                .frame(height: 110)
                .swipeActions {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "delete.left")
                    })
                    .tint(.red)
                }
                .onAppear {
                    viewModel.checkingForLoadmore(movieItem)
                }
        }
        .searchable(text: $searchText, prompt: Text("Search movies..."), suggestions: {
            List {
                ForEach(0..<10) { index in
                    HStack {
                        Text("\(index)")
                            .font(.body)
                            .padding(.horizontal)
                        Spacer()
                        Image(systemName: "arrow.up.right")
                    }
                    .onTapGesture {
                        print("\(index)")
                    }
                }
            }
            .listStyle(PlainListStyle())
            .frame(height: 250, alignment: .center)
        })
        .refreshable(action: {
            viewModel.refreshData()
        })
        .listStyle(PlainListStyle())
        .listRowSeparator(.hidden, edges: .all)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
