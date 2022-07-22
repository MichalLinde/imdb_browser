class PopularMovie{
  String? id;
  String? rank;
  String? rankUpDown;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? crew;
  String? imdbRating;
  String? imdbRatingCount;

  PopularMovie({
    this.id,
    this.rank,
    this.rankUpDown,
    this.title,
    this.fullTitle,
    this.year,
    this.image,
    this.crew,
    this.imdbRating,
    this.imdbRatingCount
  });

  PopularMovie.fromJson(Map<String, dynamic> json){
    id = json["id"];
    rank = json["rank"];
    rankUpDown = json["rankUpDown"];
    title = json["title"];
    fullTitle = json["fullTitle"];
    year = json["year"];
    image = json["image"];
    crew = json["crew"];
    imdbRating = json["imDbRating"];
    imdbRatingCount = json["imDbRatingCount"];
  }
}


// class Movie{
//   String? title;
//   String? year;
//   String? imdbID;
//   String? type;
//   String? poster;
//
//   Movie({
//     this.title,
//     this.year,
//     this.imdbID,
//     this.type,
//     this.poster
//   });
//
//   Movie.fromJson(Map<String, dynamic> json){
//     title = json["Title"];
//     year = json["Year"];
//     imdbID = json["imdbID"];
//     type = json["Type"];
//     poster = json["Poster"];
//   }
// }