import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepicker extends StatefulWidget {
  //static File propic;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Imagepicker> {
  File _image;
  //static File propic;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      //propic = image;
    });
  }
  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //propic = image;
     setState(() {
      _image = image;
      //propic = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body:ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            ),
          ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: getImageFromGallery,
          tooltip: 'Pick Image',
          child: Icon(Icons.wallpaper),
        ),
        /*FloatingActionButton(
          onPressed: getImageFromCamera,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),*/
      ],
    )
        ],
      )

      /**/
    );
  }
}