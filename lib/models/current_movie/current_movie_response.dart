import 'current_movie.dart';

class CurrentMovieResponse{
  List<CurrentMovie>? items;
  String? errorMessage;
  String? error;

  CurrentMovieResponse({
    this.items,
    this.errorMessage
  });

  CurrentMovieResponse.fromJson(Map<String, dynamic> json){
    if(json["items"] != null){
      items = [];
      json["items"].forEach((v) {
        items!.add(CurrentMovie.fromJson(v));
      });
    }
    errorMessage = json["errorMessage"];
  }

  CurrentMovieResponse.withError(String error){
    error = error;
  }
}