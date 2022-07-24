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
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(26, 17, 37, 1),
      ),
      body: BlocProvider(
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
      ),
    );
  }

  Widget _buildMovieDetails(BuildContext context, MovieDetails movie){
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          movie.image.toString(),
          fit: BoxFit.cover,
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.8,
            snap: false,
            builder: (context, controller) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.black87,
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      const Icon(Icons.maximize_rounded, size: 50, color: Colors.white,),
                      //const SizedBox(height: 20,),
                      Text(
                        movie.title.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        )
      ]
    );
  }
}