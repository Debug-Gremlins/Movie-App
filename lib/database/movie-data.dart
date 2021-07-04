import 'package:movie_app/models/movie-model.dart';

final List<Movie> movies = [
  Movie(
      id: 1,
      name: 'Inception',
      category: 'Action/Sci-fi',
      releaseDate: 2010,
      rating: 8.9,
      image: 'images/inception1.jpg'),
  Movie(
      id: 2,
      name: 'Joker',
      category: 'Action/Sci-fi',
      releaseDate: 2019,
      rating: 9.6,
      image: 'images/joker1.jpg'),
  Movie(
      id: 3,
      name: 'Mortal Engines',
      category: 'Action/Sci-fi',
      releaseDate: 2018,
      rating: 9.3,
      image: 'images/mortal_engine.jpg'),
  Movie(
      id: 4,
      name: 'The Mummy',
      category: 'Action/Sci-fi',
      releaseDate: 2001,
      rating: 9.1,
      image: 'images/mummy1.jpg'),
  Movie(
      id: 5,
      name: 'Resident Evil',
      category: 'Action/Sci-fi',
      releaseDate: 2004,
      rating: 8.7,
      image: 'images/resident_evil.jpg'),
  Movie(
      id: 6,
      name: 'Vanhelsing',
      category: 'Action/Sci-fi',
      releaseDate: 2013,
      rating: 8.9,
      image: 'images/vanhelsing1.jpg'),
  Movie(
      id: 7,
      name: 'Venom',
      category: 'Action/Sci-fi',
      releaseDate: 2018,
      rating: 9.4,
      image: 'images/venom1.jpg'),
  Movie(
      id: 1,
      name: 'Wolves',
      category: 'Action/Sci-fi',
      releaseDate: 2014,
      rating: 8.7,
      image: 'images/wolves1.jpg'),
];

final description =
    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''';

final List<String> categories = [
  'Action',
  'Sci-Fi',
  'Horror',
  'Comedy',
  'Thriller'
];

/* SQFLITE DB */
final String TABLE_MOVIE = 'tbl_movie'; //create table

final String MOVIE_COL_ID = 'movie_id';
final String MOVIE_COL_NAME = 'movie_name';
final String MOVIE_COL_CATEGORY = 'movie_cat';
final String MOVIE_COL_DATE = 'movie_year';
final String MOVIE_COL_RATING = 'movie_rating';
final String MOVIE_COL_IMAGE = 'movie_image';
final String MOVIE_COL_DESCRIPTION = 'movie_des';
final String MOVIE_COL_FAV = 'movie_fav';


