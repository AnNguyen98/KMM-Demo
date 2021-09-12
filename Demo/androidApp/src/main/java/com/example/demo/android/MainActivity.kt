package com.example.demo.android

import android.content.Context
import android.os.Bundle
import android.os.CountDownTimer
import android.widget.Toast

import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.ExperimentalAnimationApi
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.ui.*
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.*
import androidx.compose.ui.text.*
import coil.annotation.ExperimentalCoilApi
import coil.compose.*
import coil.transform.RoundedCornersTransformation
import androidx.compose.runtime.*
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.compose.runtime.livedata.observeAsState
import com.example.demo.android.ui.theme.JetpackDemoTheme
import com.example.demo.model.Movie
import com.example.demo.MoviesRepository
import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch


class HomeViewModel: ViewModel() {
    val isLoading = MutableLiveData(false)
    val movies: MutableLiveData<List<Movie>> by lazy {
        MutableLiveData<List<Movie>>()
    }

    private val mainScope = MainScope()

    fun getMovies() {
        isLoading.value = true
        val timer = object: CountDownTimer(20000, 1000) {
            override fun onTick(millisUntilFinished: Long) {
                mainScope.launch {
                    kotlin.runCatching {
                        MoviesRepository().getMovies(1)
                    }.onSuccess {
                        movies.value = it.movies
                    }.onFailure {
                        print(it.localizedMessage)
//                Toast.makeText(this@MainActivity, it.localizedMessage, Toast.LENGTH_LONG).show()
                    }
                    isLoading.value = false
                }
            }

            override fun onFinish() {
            }
        }
        timer.start()

    }

}

class MainActivity : ComponentActivity() {
    private val viewModel by viewModels<HomeViewModel>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        viewModel.getMovies()

        setContent {
            JetpackDemoTheme {
                // A surface container using the 'background' color from the theme
                HomeScreen(viewModel = viewModel)
            }
        }
    }
}

@Composable
fun HomeScreen(viewModel: HomeViewModel) {
    val isLoading: Boolean by viewModel.isLoading.observeAsState(false)

    Scaffold(
        topBar = {
            TopAppBar {
                Text("Movies",
                    style = TextStyle(
                        fontWeight = FontWeight.Bold,
                        fontSize = 19.sp
                    ),
                    modifier = Modifier.padding(horizontal = 10.dp)
                )
            }
        }
    ) {
        Box(modifier = Modifier.fillMaxWidth(),
            contentAlignment = Alignment.TopCenter
        ) {
            MoviesList(viewModel)

            if(isLoading) {
                Box(modifier = Modifier.fillMaxHeight(),
                    contentAlignment = Alignment.Center) {
                    CircularProgressIndicator()
                }
            }
        }
    }

}

@ExperimentalCoilApi
@Composable
fun MoviesList(viewModel: HomeViewModel) {
    val movies: List<Movie> by viewModel.movies.observeAsState(listOf())

    LazyColumn(
        //.verticalScroll(rememberScrollState())
        Modifier.fillMaxWidth(),contentPadding = PaddingValues(20.dp),
    ) {
        items( movies.size) { index ->
            val movie: Movie = movies.get(index)
            Row(modifier = Modifier
                .fillMaxWidth()
                .height(120.dp)) {
                Image(
                    painter = rememberImagePainter(
                        data = movie.posterPathUrl3,
                        builder = {
                            transformations(RoundedCornersTransformation(radius = 10.0f))
                        }
                    ),
                    contentDescription = null,
                    modifier = Modifier.size(width = 85.dp, height = 120.dp)
                )
                Column(modifier = Modifier.padding(6.dp), Arrangement.SpaceBetween) {
                    Text(
                        text = movie.originalTitle,
                        maxLines = 1,
                        style = TextStyle(
                            fontWeight = FontWeight.ExtraBold,
                        )
                    )
                    Text(
                        modifier = Modifier.padding(top = 5.dp),
                        text = "${movie.overview}\n\n",
                        maxLines = 3,
                        style = TextStyle(
                            fontWeight = FontWeight.Normal,
                            fontSize = 14.sp,
                        )
                    )
                    Text(
                        modifier = Modifier.padding(top = 10.dp),
                        text = "${movie.releaseDate()}", maxLines = 1,
                        style = TextStyle(
                            fontWeight = FontWeight.Normal,
                            fontSize = 10.sp,
                        )
                    )
                }
            }
            Divider(modifier = Modifier.padding(vertical = 5.dp), thickness = 1.dp)
        }
    }

}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    JetpackDemoTheme {
//        HomeScreen()
    }
}
