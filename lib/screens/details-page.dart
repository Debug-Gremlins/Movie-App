import 'package:flutter/material.dart';
import 'package:movie_app/database/movie-data.dart';

class DetailsPage extends StatelessWidget {
  final int id;
  const DetailsPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = movies.firstWhere((e) => e.id == id);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: movie.id,
                child: Image.asset(
                  movie.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20.0),
              // color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.name,
                            style: TextStyle(
                                fontFamily: 'Martel',
                                fontSize: 35,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          ),
                          Text(
                            movie.category,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 20,
                                color: Color(0xff3d3c50),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            movie.rating.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Color(0xff371c21),
                      fontWeight: FontWeight.w800,
                      fontSize: 19,
                    ),
                  )
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
