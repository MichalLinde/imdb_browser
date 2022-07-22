import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../repository/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState>{
  final MovieRepository repo = Modular.get<MovieRepository>();

  MovieDetailsCubit() : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(String movieId) async {
    try{
      emit(MovieDetailsLoading());
      final movie = await repo.fetchMovieDetails(movieId);
      emit(MovieDetailsLoaded(movie));
    } on NetworkError{
      emit(const MovieDetailsError("Couldn't fetch data."));
    }
  }
}