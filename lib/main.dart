import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
import 'package:twosuk/add.dart';
import 'package:twosuk/favorite.dart';
import 'package:twosuk/profile.dart';

import 'feed.dart';
import 'home.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MainPage());
  });
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  static const snackBarDuration = Duration(seconds: 2);
  TabController controllerMain;

  DateTime backButtonPressTime;
  var mainIndex = 0;

  @override
  void initState() {
    controllerMain = TabController(vsync: this, length: 5, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    controllerMain.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        body: Builder(builder: (BuildContext context) {
          // The BuildContext must be from one of the Scaffold's children.
          return WillPopScope(
            onWillPop: () => onWillPop(context),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: TabBarView(
                controller: controllerMain,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Home(),
                  Feed(),
                  Add(),
                  Favorite(),
                  Profile(),
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar: new TabBar(
          controller: controllerMain,
          onTap: (index) {
            print("tab all index ke $index");
          },
          isScrollable: false,
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.rss_feed),
            ),
            Tab(
              icon: new Icon(FontAwesomeIcons.plusSquare),
            ),
            Tab(
              icon: new Icon(Icons.favorite),
            ),
            Tab(
              // icon: new Icon(Icons.person_pin),
              icon: Container(
                // padding: EdgeInsets.all(50),
                margin: EdgeInsets.all(5),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset('assets/images/avatar-6.jpg'),
              ),
            ),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black38,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 0.0),
          ),
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.black45,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Future<bool> onWillPop(BuildContext context) async {
    DateTime currentTime = DateTime.now();

    bool backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            currentTime.difference(backButtonPressTime) > snackBarDuration;
    print(controllerMain.index);
    if (controllerMain.index != 0) {
      setState(() {
        controllerMain.index = 0;
        // mainIndex=0;
      });
      return false;
    }

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = currentTime;
      // Scaffold.of(context).showSnackBar(snackBar);

      Toast.show('Press once again to exit', context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return false;
    }

    return true;
  }
}
