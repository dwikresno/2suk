import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
import 'package:twosuk/home/fresh.dart';
import 'package:twosuk/home/hot.dart';
import 'package:twosuk/search.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var colorTab = Colors.deepOrange[700];
  TabController controllerHome;

  @override
  void initState() {
    // TODO: implement initState
    controllerHome = TabController(vsync: this, length: 2, initialIndex: 0);
    controllerHome.addListener(() {
      setState(() {
        controllerHome.index == 0
            ? colorTab = Colors.deepOrange[700]
            : colorTab = Colors.blue;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerHome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          title: logo(),
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Search(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.search, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () {
                print(controllerHome.index);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 5, right: 10),
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
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
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
          bottom: TabBar(
            controller: controllerHome,
            onTap: (index) {
              setState(() {
                controllerHome.index == 0
                    ? colorTab = Colors.deepOrange[700]
                    : colorTab = Colors.blue;
              });
            },
            indicatorColor: colorTab,
            unselectedLabelColor: Colors.black38,
            labelColor: colorTab,
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.fireAlt)),
              Tab(icon: Icon(Icons.fiber_new)),
            ],
          ),
        ),
        body: TabBarView(
          controller: controllerHome,
          children: <Widget>[
            Hot(),
            Fresh(),
          ],
        ));
  }

  Widget logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.looks_two,
          color: Colors.green,
          size: 26,
        ),
        Text(
          'SUK',
          style: TextStyle(
            color: Colors.green,
            fontSize: 26,
          ),
        )
      ],
    );
  }
}
