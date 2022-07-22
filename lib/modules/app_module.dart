import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/api/api_client.dart';
import 'package:imdb_browser/api/api_service.dart';
import 'package:imdb_browser/cubits/current_movie_cubit/current_movie_cubit.dart';
import 'package:imdb_browser/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:imdb_browser/modules/home_module.dart';
import 'package:imdb_browser/repository/movie_repository.dart';
import 'package:imdb_browser/views/pages/home_page.dart';
import 'package:imdb_browser/views/pages/second_page.dart';

import '../cubits/movie_details_cubit/movie_details_cubit.dart';
import 'movie_details_module.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => ApiService()),
    Bind((i) => MovieRepository()),
    // Bind.factory((i) => PopularMovieCubit()),
    // Bind.factory((i) => CurrentMovieCubit()),
    Bind((i) => Dio()),
    Bind((i) => ApiClient()),
    //Bind.factory((i) => MovieDetailsCubit())
  ];

  @override
  List<ModularRoute> get routes => [
    // ChildRoute("/", child: (context, args) => HomePage(), transition: TransitionType.size),
    // ChildRoute("/second", child: (context, args) => SecondPage(movieId: args.data), transition: TransitionType.size),
    ModuleRoute("/details-module", module: MovieDetailsModule()),
    ModuleRoute("/", module: HomeModule())
  ];
}