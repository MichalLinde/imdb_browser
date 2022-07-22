import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/repository/movie_repository.dart';

import 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState>{
  final MovieRepository repo = Modular.get<MovieRepository>();

  PopularMovieCubit() : super(PopularMovieInitial());

  Future<void> fetchPopularMovies() async{
    try{
      emit(PopularMovieLoading());
      final movies = await repo.fetchPopularMovies();
      emit(PopularMovieLoaded(movies));
    } on NetworkError{
      emit(const PopularMovieError("Couldn't fetch data."));
    }
  }
}