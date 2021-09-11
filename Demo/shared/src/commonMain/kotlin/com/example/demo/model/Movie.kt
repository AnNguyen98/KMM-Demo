package com.example.demo.model

import kotlinx.datetime.*
import kotlinx.datetime.Instant
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class Movie {
    var adult: Boolean = false
    @SerialName("backdrop_path")
    var backdropPath: String = ""
    var id: String = ""
    @SerialName("original_title")
    var originalTitle: String = ""
    var overview: String = ""
    var popularity: Double = 0.0
    @SerialName("poster_path")
    private var posterPath: String = ""
    @SerialName("release_date")
    private var releaseDateString: String = ""
    fun releaseDate(): String {
        return try {
            val dateTime = LocalDate.parse(releaseDateString)
            "${dateTime.month.name}, ${dateTime.dayOfMonth}-${dateTime.year}"
        } catch (e: Exception) {
            ""
        }
    }
    @SerialName("vote_count")
    var voteCount: Int = 0
    @SerialName("vote_average")
    var voteAverage: Double = 0.0

    val posterPathUrl3: String by lazy {
        BASE_IMAGE3_URL + posterPath
    }

    val posterPathUrl5: String by lazy {
        BASE_IMAGE5_URL + posterPath
    }

    companion object {
        private const val BASE_IMAGE3_URL: String = "https://image.tmdb.org/t/p/w300"
        private const val BASE_IMAGE5_URL: String = "https://image.tmdb.org/t/p/w500"
    }
}

@Serializable
data class MovieApiResponse(
    @SerialName("page")
    val page: Int,
    @SerialName("total_pages")
    val totalPage: Int,
    @SerialName("total_results")
    val totalResult: Int,
    @SerialName("results")
    val movies: List<Movie>
)

/*
 "adult": false,
 "backdrop_path": "/jlGmlFOcfo8n5tURmhC7YVd4Iyy.jpg",
 "genre_ids": [
     28,
     12,
     14,
     35
 ],
 "id": 436969,
 "original_language": "en",
 "original_title": "The Suicide Squad",
 "overview": "Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.",
 "popularity": 3865.874,
 "poster_path": "/lSEr1nphZuCqXli3VziIgCI8Ivf.jpg",
 "release_date": "2021-07-28",
 "title": "The Suicide Squad",
 "video": false,
 "vote_average": 8,
 "vote_count": 3091
 */