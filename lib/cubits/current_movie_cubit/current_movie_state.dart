import 'package:equatable/equatable.dart';

import '../../models/current_movie/current_movie_response.dart';

abstract class CurrentMovieState extends Equatable{
  const CurrentMovieState();

  @override
  List<Object?> get props => [];
}

class CurrentMovieInitial extends CurrentMovieState {}

class CurrentMovieLoading extends CurrentMovieState {}

class CurrentMovieLoaded extends CurrentMovieState{
  final CurrentMovieResponse movies;
  const CurrentMovieLoaded(this.movies);
}

class CurrentMovieError extends CurrentMovieState {
  final String? message;
  const CurrentMovieError(this.message);
}