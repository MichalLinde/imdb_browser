class CurrentMovie{
  String? id;
  String? title;
  String? releaseState;
  String? image;
  String? plot;
  String? iMDbRating;

  CurrentMovie({
    this.id,
    this.title,
    this.releaseState,
    this.image,
    this.plot,
    this.iMDbRating
  });

  CurrentMovie.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    releaseState = json["releaseState"];
    image = json["image"];
    plot = json["plot"];
    iMDbRating = json["imDbRating"];
  }
}