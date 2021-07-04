import 'package:movie_app/database/movie-data.dart';

class Movie {
  int id;
  String name;
  String category;
  int releaseDate;
  double rating;
  String image;
  String description;
  bool isFavourite;

  Movie(
      {this.id,
      this.name,
      this.category,
      this.releaseDate,
      this.rating,
      this.image,
      this.description,
      this.isFavourite = false});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      MOVIE_COL_NAME: name,
      MOVIE_COL_CATEGORY: category,
      MOVIE_COL_DATE: releaseDate,
      MOVIE_COL_RATING: rating,
      MOVIE_COL_IMAGE: image,
      MOVIE_COL_DESCRIPTION: description,
      MOVIE_COL_FAV: isFavourite ? 1 : 0
    };
    if (id != null) {
      map[MOVIE_COL_ID] = id;
    }
    return map;
  }

  Movie.fromMap(Map<String, dynamic> map) {
    id = map[MOVIE_COL_ID];
    name = map[MOVIE_COL_NAME];
    description = map[MOVIE_COL_DESCRIPTION];
    category = map[MOVIE_COL_CATEGORY];
    releaseDate = map[MOVIE_COL_DATE];
    rating = map[MOVIE_COL_RATING];
    image = map[MOVIE_COL_IMAGE];
    isFavourite = map[MOVIE_COL_FAV] == 0 ? false : true;
  }

  @override
  String toString() {
    return 'Movie{id : $id, name : $name, category : $category, releaseYear : $releaseDate, rating : $rating, image : $image, description : $description, isFavourite: $isFavourite}';
  }
}
