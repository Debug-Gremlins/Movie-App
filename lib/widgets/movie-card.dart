import 'package:flutter/material.dart';
import 'package:movie_app/models/movie-model.dart';
import 'package:movie_app/screens/details-page.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  MovieCard({Key key, this.movie}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(id: widget.movie.id)));
      },
      child: Card(
        color: Color(0xfffbecb2),
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Hero(
                tag: widget.movie.id,
                child: Image.asset(
                  widget.movie.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_view_day_rounded,
                        size: 30,
                        color: Color(0xff0a3208),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        widget.movie.releaseYear.toString(),
                        style: TextStyle(fontSize: 18, fontFamily: 'Kufam'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.category,
                        size: 30,
                        color: Color(0xff51244a),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        widget.movie.category,
                        style: TextStyle(fontSize: 18, fontFamily: 'Kufam'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Color(0xff9d0e2d),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        widget.movie.rating.toString(),
                        style: TextStyle(fontSize: 18, fontFamily: 'Kufam'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          iconSize: 30.0,
                          color: Colors.red,
                          icon: Icon(widget.movie.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              widget.movie.isFavourite =
                                  !widget.movie.isFavourite;
                            });
                          }),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
