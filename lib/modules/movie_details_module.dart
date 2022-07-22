import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:imdb_browser/views/pages/second_page.dart';

class MovieDetailsModule extends Module{
  @override
  List<Bind> get binds => [
    Bind.factory((i) => MovieDetailsCubit())
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (context, args) => SecondPage(movieId: args.data))
  ];
}