package com.example.demo.network

import com.example.demo.model.MovieApiResponse
import io.ktor.client.HttpClient
import io.ktor.client.features.*
import io.ktor.client.features.json.JsonFeature
import io.ktor.client.features.json.serializer.KotlinxSerializer
import io.ktor.client.request.*
import kotlinx.serialization.json.Json

class MoviesApi {
    private val httpClient by lazy {
        HttpClient {
            install(JsonFeature) {
                val json = Json { ignoreUnknownKeys = true; isLenient = true; useAlternativeNames = false }
                serializer = KotlinxSerializer(json)
            }
        }
    }

//    private val httpClient = HttpClient {
//        install(JsonFeature) {
//            val json = Json { ignoreUnknownKeys = true }
//            serializer = KotlinxSerializer(json)
//        }
//    }

    var page: Int = 1
    val LAUNCHES_ENDPOINT: String by lazy {
        "http://api.themoviedb.org/3/movie/popular?api_key=5e027139c66f977f5356baedc345f04f&page=$page"
    }

    companion object {
//        private var LAUNCHES_ENDPOINT = "http://api.themoviedb.org/3/movie/popular?api_key=5e027139c66f977f5356baedc345f04f&page=$page"
    }

    suspend fun getMovies(page: Int): MovieApiResponse {
        this.page = page
        return httpClient.get(LAUNCHES_ENDPOINT)
    }
}