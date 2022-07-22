import 'package:equatable/equatable.dart';

import '../../models/popular_movie/popular_movie_response.dart';

abstract class PopularMovieState extends Equatable{
  const PopularMovieState();

  @override
  List<Object?> get props => [];
}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState{
  final PopularMovieResponse movies;
  const PopularMovieLoaded(this.movies);
}

class PopularMovieError extends PopularMovieState {
  final String? message;
  const PopularMovieError(this.message);
}