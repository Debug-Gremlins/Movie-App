class Movie {
  int id;
  String name;
  String category;
  int releaseYear;
  double rating;
  String image;
  String description;
  bool isFavourite;

  Movie(
      {this.id,
      this.name,
      this.category,
      this.releaseYear,
      this.rating,
      this.image,
      this.description,
      this.isFavourite = false});

  @override
  String toString() {
    return 'Movie{id : $id, name : $name, category : $category, releaseYear : $releaseYear, rating : $rating, image : $image, description : $description, isFavourite: $isFavourite}';
  }
}
