class MovieDetails{
  String? id;
  String? title;
  String? releaseDate;
  String? runTimeStr;
  String? plot;
  String? image;
  String? directors;
  String? writers;
  String? stars;
  String? genres;
  String? imdbRating;
  String? metacriticRating;
  String? errorMessage;
  String? error;

  MovieDetails({
    this.id,
    this.title,
    this.releaseDate,
    this.runTimeStr,
    this.plot,
    this.image,
    this.directors,
    this.writers,
    this.stars,
    this.genres,
    this.imdbRating,
    this.metacriticRating,
    this.errorMessage
  });

  MovieDetails.withError(String error){
    error = error;
  }

  MovieDetails.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    releaseDate = json["releaseDate"];
    runTimeStr = json["runTimeStr"];
    plot = json["plot"];
    image = json["image"];
    directors = json["directors"];
    writers = json["writers"];
    stars = json["stars"];
    genres = json["genres"];
    imdbRating = json["imDbRating"];
    metacriticRating = json["metacriticRating"];
    errorMessage = json["errorMessage"];
  }
}