import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/api/api_service.dart';

import '../api/api_client.dart';
import '../models/current_movie/current_movie_response.dart';
import '../models/movie_details/movie_details.dart';
import '../models/popular_movie/popular_movie_response.dart';

class MovieRepository{

  final apiClient = Modular.get<ApiClient>();

  Future<PopularMovieResponse> fetchPopularMovies() async{
    return apiClient.fetchPopularMovies();
  }

  Future<CurrentMovieResponse> fetchCurrentMovies() async{
    return apiClient.fetchCurrentMovies();
  }

  Future<MovieDetails> fetchMovieDetails(String movieId) async{
    return apiClient.fetchMovieDetails(movieId);
  }
  // final apiService = Modular.get<ApiService>();
  //
  // Future<PopularMovieResponse> fetchPopularMovies() async{
  //   return apiService.fetchPopularMovies();
  // }
  //
  // Future<CurrentMovieResponse> fetchCurrentMovies() async{
  //   return apiService.fetchCurrentMovies();
  // }
}

class NetworkError extends Error{}