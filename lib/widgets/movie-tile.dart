import 'package:flutter/material.dart';
import 'package:movie_app/models/movie-model.dart';

class MovieList extends StatefulWidget {
  final Movie movie;
  MovieList({Key key, this.movie}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.movie.name),
      subtitle: Text(widget.movie.category),
      leading: Image.asset(
        widget.movie.image,
        fit: BoxFit.cover,
        height: 100,
        width: 100,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 25,
            color: Colors.red,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(widget.movie.rating.toString())
        ],
      ),
    );
  }
}
