import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/views/pages/home_page.dart';

import '../cubits/current_movie_cubit/current_movie_cubit.dart';
import '../cubits/popular_movie_cubit/popular_movie_cubit.dart';

class HomeModule extends Module{

  @override
  List<Bind> get binds => [
    Bind.factory((i) => PopularMovieCubit()),
    Bind.factory((i) => CurrentMovieCubit()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (context, args) => HomePage())
  ];
}