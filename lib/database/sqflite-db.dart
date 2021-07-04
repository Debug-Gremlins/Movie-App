import 'package:movie_app/database/movie-data.dart';
import 'package:movie_app/models/movie-model.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';

class DBSQFliteHelper {
  static final String CREATE_TABLE_MOVIE = '''create table $TABLE_MOVIE(

    $MOVIE_COL_ID integer primary autoincrement,
    $MOVIE_COL_NAME text not null,    
    $MOVIE_COL_CATEGORY text not null,    
    $MOVIE_COL_DATE integer not null,    
    $MOVIE_COL_RATING real not null,    
    $MOVIE_COL_IMAGE text not null,    
    $MOVIE_COL_DESCRIPTION text not null,    
    $MOVIE_COL_FAV integer not null,
  )''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'movie.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(CREATE_TABLE_MOVIE);
    });
  }

  static Future<int> insertMovie(Movie movie) async {
    final db = await open();
    return db.insert(TABLE_MOVIE, movie.toMap());
  }

  static Future<List<Movie>> getAllMovies(Movie movie) async {
    final db = await open();
    List<Map<String, dynamic>> mapList =
        await db.rawQuery('select * from $TABLE_MOVIE');
    return List.generate(
        mapList.length, (index) => Movie.fromMap(mapList[index]));
  }
}
