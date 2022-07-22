import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/popular_movie/popular_movie.dart';

class PopularMovieListCard extends StatelessWidget {
  final PopularMovie movie;

  PopularMovieListCard({required this.movie});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 160,
      child: GestureDetector(
        onTap: () => Modular.to.navigate("/details-module/", arguments: movie.id),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: movie.title.toString(),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie.image.toString())
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              movie.title.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato'
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
