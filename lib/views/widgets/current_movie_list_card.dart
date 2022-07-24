import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/current_movie/current_movie.dart';

class CurrentMovieListCard extends StatelessWidget{
  final CurrentMovie movie;
  const CurrentMovieListCard({ required this.movie });


  @override
  Widget build(BuildContext context){
    final double stars = double.parse(movie.iMDbRating!) / 2;

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: GestureDetector(
        onTap: () => Modular.to.pushNamed("/details-module/", arguments: movie.id),
        child: Card(
          color: const Color(0x261D32),
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      movie.image.toString()
                    )
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: Text(
                        movie.title.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lato"
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RatingBarIndicator(
                      rating: stars,
                      unratedColor: const Color.fromRGBO(26, 17, 37, 1),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 210,
                      child: Text(
                        movie.plot.toString(),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: "Lato"
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}