import 'package:flutter/material.dart';
import 'package:twosuk/page/search.dart';

class Notify extends StatefulWidget {
  Notify({Key key}) : super(key: key);

  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Search(),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(top: 0, left: 5, right: 5),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ),
        GestureDetector(
          onTap: () {
            // print(controllerHome.index);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 0, left: 5, right: 10),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Icon(Icons.notifications, color: Colors.black),
                  Positioned(
                    // top: 10,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          '99',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
