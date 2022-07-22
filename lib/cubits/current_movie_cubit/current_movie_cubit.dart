import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/cubits/current_movie_cubit/current_movie_state.dart';
import 'package:imdb_browser/repository/movie_repository.dart';

class CurrentMovieCubit extends Cubit<CurrentMovieState>{
  final MovieRepository repo = Modular.get<MovieRepository>();

  CurrentMovieCubit() : super(CurrentMovieInitial());

  Future<void> fetchCurrentMovies() async {
    try{
      emit(CurrentMovieLoading());
      final movies = await repo.fetchCurrentMovies();
      emit(CurrentMovieLoaded(movies));
    } on NetworkError{
      emit(const CurrentMovieError("Couldn't fetch data."));
    }
  }
}