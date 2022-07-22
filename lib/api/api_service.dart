import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/utils/constants.dart';

import '../models/current_movie/current_movie_response.dart';
import '../models/movie_details/movie_details.dart';
import '../models/popular_movie/popular_movie_response.dart';

class ApiService{
  final Dio _dio = Modular.get<Dio>();
  
  Future<PopularMovieResponse> fetchPopularMovies() async{
    try{
      const url = "${Constants.baseUrl}/MostPopularMovies/${Constants.apiKey}";
      Response response = await _dio.get(url);
      return PopularMovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      log("Exception occured: $error stackTrace: $stacktrace");
      return PopularMovieResponse.withError("Data not found / Connection issue");
    }
  }

  Future<CurrentMovieResponse> fetchCurrentMovies() async{
    try{
      const url = "${Constants.baseUrl}/InTheaters/${Constants.apiKey}";
      Response response = await _dio.get(url);
      return CurrentMovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      log("Exception occured: $error stackTrace: $stacktrace");
      return CurrentMovieResponse.withError("Data not found / Connection issue");
    }
  }

  // Future<MovieDetails> fetchMovieDetails(String movieId) async{
  //   try{
  //     String url = "${Constants.baseUrl}Title/${Constants.apiKey}/$movieId";
  //     Response response = await _dio.get(url);
  //     return
  //   }
  // }

}