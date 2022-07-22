import 'package:equatable/equatable.dart';

import '../../models/movie_details/movie_details.dart';

abstract class MovieDetailsState extends Equatable{
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState{
  final MovieDetails movie;
  const MovieDetailsLoaded(this.movie);
}

class MovieDetailsError extends MovieDetailsState {
  final String? message;
  const MovieDetailsError(this.message);
}