import 'package:flutter/material.dart';

class WidgetCustom extends StatelessWidget {
  const WidgetCustom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Center(
          child: Container(
            padding: EdgeInsets.only(top: 5),
            // height: 10,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 3,
                  color: Colors.black12,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(top: 2),
            // height: 10,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 3,
                  color: Colors.black12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
