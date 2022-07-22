import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:imdb_browser/cubits/movie_details_cubit/movie_details_state.dart';
import 'package:imdb_browser/views/widgets/loading_widget.dart';

import '../../models/movie_details/movie_details.dart';
import '../../models/popular_movie/popular_movie.dart';

class SecondPage extends StatefulWidget{
  final String? movieId;

  SecondPage({required this.movieId});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{

  final MovieDetailsCubit movieDetailsCubit = Modular.get<MovieDetailsCubit>();

  @override
  void initState(){
    movieDetailsCubit.fetchMovieDetails(widget.movieId.toString());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => Modular.to.navigate("/"),
                child: const Icon(
                  Icons.arrow_back,
                  size: 26.0,
                ),
              )
          )
        ],
      ),
      body: Center(
        child: BlocProvider(
          create: (_) => movieDetailsCubit,
          child: BlocListener<MovieDetailsCubit, MovieDetailsState>(
            listener: (context, state){
              if (state is MovieDetailsError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message!)),
                );
              }
            },
            child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
              builder: (context, state){
                if (state is MovieDetailsInitial) {
                  return LoadingWidget();
                } else if (state is MovieDetailsLoading) {
                  return LoadingWidget();
                } else if (state is MovieDetailsLoaded) {
                  return _buildMovieDetails(context, state.movie);
                } else if (state is MovieDetailsError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        )
      ),
    );
  }

  Widget _buildMovieDetails(BuildContext context, MovieDetails movie){
    return Center(
      child: Image.network(
          movie.image.toString(),
        width: 180,
        height: 300,
      )
    );
  }
}