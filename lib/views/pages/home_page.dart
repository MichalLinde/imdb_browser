import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/cubits/current_movie_cubit/current_movie_cubit.dart';
import 'package:imdb_browser/cubits/current_movie_cubit/current_movie_state.dart';
import 'package:imdb_browser/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:imdb_browser/models/current_movie/current_movie_response.dart';
import 'package:imdb_browser/models/popular_movie/popular_movie_response.dart';
import 'package:imdb_browser/views/widgets/current_movie_list_card.dart';
import 'package:imdb_browser/views/widgets/loading_widget.dart';
import 'package:imdb_browser/views/widgets/popular_movie_list_card.dart';

import '../../cubits/popular_movie_cubit/popular_movie_state.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  //final MovieBloc _movieBloc = Modular.get<MovieBloc>();
  final PopularMovieCubit popularMovieCubit = Modular.get<PopularMovieCubit>();
  final CurrentMovieCubit currentMovieCubit = Modular.get<CurrentMovieCubit>();

  @override
  void initState(){
    //_movieBloc.add(GetMovieList());
    popularMovieCubit.fetchPopularMovies();
    currentMovieCubit.fetchCurrentMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(26, 17, 37, 1),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: const Text("IMDb browser", style: TextStyle(color: Colors.black),),
      //   actions: <Widget>[
      //     Padding(
      //         padding: const EdgeInsets.only(right: 20.0),
      //         child: GestureDetector(
      //           onTap: () => Modular.to.navigate("/second"),
      //           child: const Icon(
      //             Icons.search,
      //             size: 26.0,
      //             color: Colors.black,
      //           ),
      //         )
      //     )
      //   ],
      // ),
      // body: _buildMovieList()
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              centerTitle: true,
              title: const Text(
                "IMDbrowser",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold
                ),
              ),
              floating: true,
              snap: true,
              backgroundColor: const Color.fromRGBO(26, 17, 37, 1),
              actions: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () => Modular.to.navigate("/second"),
                        child: const Icon(
                          Icons.search,
                          size: 26.0,
                          color: Colors.white,
                        ),
                      )
                  )
                ],
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                        "Popular now:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lato",
                      ),
                    ),
                  ],
                ),
              ),
              _buildPopularMovieList(),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "In Theaters:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lato",
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 18)),
                        onPressed: () {},
                        child: const Text("View all")
                    ),
                  ],
                ),
              ),
              _buildCurrentMovieList()
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home"
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: "Search"
      //     )
      //   ],
      //   //currentIndex: _selectedIndex,
      // ),
    );
  }

  Widget _buildPopularMovieList(){
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: BlocProvider(
        create: (_) => popularMovieCubit,
        child: BlocListener<PopularMovieCubit, PopularMovieState>(
          listener: (context, state) {
            if (state is PopularMovieError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message!)),
              );
            }
          },
          child: BlocBuilder<PopularMovieCubit, PopularMovieState>(
            builder: (context, state){
              if (state is PopularMovieInitial) {
                return _buildLoading();
              } else if (state is PopularMovieLoading) {
                return _buildLoading();
              } else if (state is PopularMovieLoaded) {
                return _buildPopularCard(context, state.movies);
              } else if (state is PopularMovieError) {
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

  Widget _buildCurrentMovieList(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocProvider(
        create: (_) => currentMovieCubit,
        child: BlocListener<CurrentMovieCubit, CurrentMovieState>(
          listener: (context, state){
            if (state is CurrentMovieError){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message!))
              );
            }
          },
          child: BlocBuilder<CurrentMovieCubit, CurrentMovieState>(
            builder: (context, state){
              if (state is CurrentMovieInitial) {
                return LoadingWidget();
              } else if (state is CurrentMovieLoading) {
                return LoadingWidget();
              } else if (state is CurrentMovieLoaded) {
                return _buildCurrentCard(context, state.movies);
              } else if (state is CurrentMovieError) {
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

  Widget _buildPopularCard(BuildContext context, PopularMovieResponse movies){
    return Container(
      height: 275,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.items == null ? 0 : (movies.items!.length > 10 ? 10 : movies.items!.length),
        itemBuilder: (context, index) => PopularMovieListCard(movie: movies.items![index]),
      ),
    );
  }

  Widget _buildCurrentCard(BuildContext context, CurrentMovieResponse movies){
    return Container(
      height: 1210,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 8),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.items == null ? 0 : (movies.items!.length > 7 ? 7 : movies.items!.length),
          itemBuilder: (context, index) => CurrentMovieListCard(movie: movies.items![index]),
        )
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator(),);
}