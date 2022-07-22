import 'popular_movie.dart';

class PopularMovieResponse{
  List<PopularMovie>? items;
  String? errorMessage;
  String? error;

  PopularMovieResponse({
    this.items,
    this.errorMessage
  });

  PopularMovieResponse.withError(String error){
    error = error;
  }

  PopularMovieResponse.fromJson(Map<String, dynamic> json){
    if(json["items"] != null){
      items = [];
      json["items"].forEach((v) {
        items!.add(PopularMovie.fromJson(v));
      });
    }
    errorMessage = json["errorMessage"];
  }
}

// class MovieResponse{
//   List<Movie>? search;
//   String? totalResults;
//   String? response;
//   String? error;
//
//   MovieResponse({
//     this.search,
//     this.totalResults,
//     this.response
//   });
//
//   MovieResponse.withError(String errorMessage){
//     error = errorMessage;
//   }
//
//   MovieResponse.fromJson(Map<String, dynamic> json){
//     if (json["Search"] != null){
//       search = [];
//       json["Search"].forEach((v) {
//         search!.add(Movie.fromJson(v));
//       });
//     }
//     totalResults = json["totalResults"];
//     response = json["Response"];
//   }
//
// }