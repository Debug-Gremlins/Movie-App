import 'package:flutter/material.dart';
import 'package:movie_app/database/movie-data.dart';
import 'package:movie_app/database/sqflite-db.dart';
import 'package:movie_app/models/movie-model.dart';
import 'package:movie_app/screens/add-new-movie.dart';
import 'package:movie_app/widgets/movie-card.dart';
// import 'package:movie_app/widgets/movie-tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> _movieList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    DBSQFliteHelper.getAllMovies(Movie()).then((movieList) {
      setState(() {
        _movieList = movieList;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[100],
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddNewMoviePage()));
          },
        ),
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Color(0xff3d3c50),
          elevation: 0.0,
          title: Text(
            'Movie App',
            style: TextStyle(
                fontFamily: 'Martel',
                fontWeight: FontWeight.bold,
                fontSize: 25.0),
          ),
        ),
        body: _movieList.length == 0
            ? Center(
                child: Text(
                  'No movies added yet!\nAdd New One',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blueGrey[800],
                    fontFamily: 'Kufam'
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: _movieList.length,
                itemBuilder: (BuildContext context, index) => MovieCard(
                      movie: _movieList[index], // Named-Optional Constructor
                    )));
  }
}


/*  // ListView()

 ListView(
           children: movies.map((e) => MovieList(movie: e)).toList(),
         ) */


/*  // ListView.builder()

  ListView.builder(
             itemCount: movies.length,
             itemBuilder: (BuildContext context, index) => MovieList(
                   movie: movies[index], // Named-Optional Constructor
  )) */