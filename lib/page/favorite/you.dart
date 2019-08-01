import 'package:flutter/material.dart';

class You extends StatefulWidget {
  You({Key key}) : super(key: key);

  _YouState createState() => _YouState();
}

class _YouState extends State<You> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Align(
                                alignment: Alignment.topCenter,
                                widthFactor: MediaQuery.of(context).size.width,
                                heightFactor: 70,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width,
                                  height: 70,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        autofocus: true,
                                        decoration: InputDecoration(
                                            hintText: "Update Info"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        style: TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                            hintText: 'Province',
                            labelText: 'Province',
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Province can\'t";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
