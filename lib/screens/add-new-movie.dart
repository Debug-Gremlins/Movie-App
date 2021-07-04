import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/database/movie-data.dart';
import 'package:movie_app/models/movie-model.dart';

class AddNewMoviePage extends StatefulWidget {
  AddNewMoviePage({Key key}) : super(key: key);

  @override
  _AddNewMoviePageState createState() => _AddNewMoviePageState();
}

class _AddNewMoviePageState extends State<AddNewMoviePage> {
  final movie = Movie();
  DateTime _selectedDate;
  String category = 'Action';
  String _imagePath = null;
  final _formKey = GlobalKey<FormState>();

  void _onSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      movie.category = category;
      print(movie);
    }
  }

  void _openDatePickDialouge() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime(2030))
        .then((date) => {
              setState(() {
                _selectedDate = date;
                movie.releaseYear = _selectedDate.year;
              })
            });
  }

/*  
      // .then(()=>null)

  void _openDatePickDialouge() {
    Future<DateTime> selectedDate = showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2030));
    selectedDate.then((date) => {
          setState(() {
            _selectedDate = date;
          })
        });
  }

*/

/*  // async-await pair

  void _openDatePickDialouge() async {
    DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2030)
    );
  }

*/
  void _captureImage() {
    ImagePicker().getImage(source: ImageSource.camera).then((imageFile) => {
          setState(() {
            _imagePath = imageFile.path;
            movie.image = _imagePath;
          })
        });
  }

  void _selectImage() {
    ImagePicker().getImage(source: ImageSource.gallery).then((imageFile) => {
          setState(() {
            _imagePath = imageFile.path;
            movie.image = _imagePath;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Add New Movie",
          style: TextStyle(
              fontFamily: 'Martel',
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Movie Name',
                    labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontFamily: 'Martel',
                        fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueGrey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field must not be empty!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    movie.name = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Movie Rating',
                    labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontFamily: 'Martel',
                        fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueGrey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field must not be empty!';
                    } else if (double.parse(value) < 0 ||
                        double.parse(value) > 10) {
                      return 'Range should be between 0 to 10';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    movie.rating = double.parse(value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Enter Description',
                    labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontFamily: 'Martel',
                        fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueGrey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field must not be empty!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    movie.description = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                        color: Colors.purple[200],
                        onPressed: _openDatePickDialouge,
                        child: Text(
                          'Pick Release Year',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    Text(
                      _selectedDate == null
                          ? 'No date chosen'
                          : DateFormat('EEE, MMM, dd, yyyy')
                              .format(_selectedDate),
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Kufam',
                          color: Colors.pink[500]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Select Category',
                  style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 20,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
                DropdownButton(
                  underline: Divider(
                    color: Colors.purple,
                    height: 10,
                  ),
                  value: category,
                  items: categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      category = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrange[200],
                        ),
                        child: Center(
                            child: _imagePath == null
                                ? Text(
                                    "No image found!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Kufam',
                                        fontSize: 25),
                                    textAlign: TextAlign.center,
                                  )
                                : Image.file(
                                    File(_imagePath),
                                    fit: BoxFit.cover,
                                  ))),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.camera,
                              size: 30.0,
                              color: Colors.green,
                            ),
                            onPressed: _captureImage),
                        IconButton(
                            icon: Icon(
                              Icons.photo_album,
                              size: 30.0,
                              color: Colors.lightBlueAccent,
                            ),
                            onPressed: _selectImage)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: _onSave),
              ],
            ),
          )),
    );
  }
}
