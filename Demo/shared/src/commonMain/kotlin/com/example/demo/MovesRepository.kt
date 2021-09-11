package com.example.demo

import com.example.demo.model.MovieApiResponse
import com.example.demo.network.MoviesApi

class MovesRepository {
    private val api = MoviesApi()

    @Throws(Exception::class) suspend fun getMovies(page: Int = 1): MovieApiResponse {
        return api.getMovies(page)
    }
}