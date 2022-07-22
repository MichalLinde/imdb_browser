import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:retrofit/retrofit.dart';

import '../models/current_movie/current_movie_response.dart';
import '../models/movie_details/movie_details.dart';
import '../models/popular_movie/popular_movie_response.dart';
import '../utils/constants.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient{

  factory ApiClient() = _ApiClient;

  @GET("/MostPopularMovies/${Constants.apiKey}")
  Future<PopularMovieResponse> fetchPopularMovies();

  @GET("/InTheaters/${Constants.apiKey}")
  Future<CurrentMovieResponse> fetchCurrentMovies();

  @GET("/Title/${Constants.apiKey}/{id}")
  Future<MovieDetails> fetchMovieDetails(@Path("id") String movieId);
}