import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Use Camera'),
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Take From Gallery'),
              )
            ],
          ),
        ),
      ),
    );
  }
}