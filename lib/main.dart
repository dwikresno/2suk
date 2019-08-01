import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:twosuk/model/content_model.dart';
import 'package:twosuk/page/add.dart';
import 'package:twosuk/page/favorite.dart';
import 'package:twosuk/page/feed.dart';
import 'package:twosuk/page/home.dart';
import 'package:twosuk/page/profile.dart';
import 'package:twosuk/provider/provider_service.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    Provider.debugCheckInvalidValueType = null;
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
      home: ChangeNotifierProvider<ProviderService>(
        builder: (_) => ProviderService(),
        child: FutureBuilder<ContentModel>(
          builder: (context,snapshot) {
          final providerService = Provider.of<ProviderService>(context);
          providerService.getAppInfo();
          // The BuildContext must be from one of the Scaffold's children.
          return Scaffold(
            body: WillPopScope(
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
                    Home(providerService),
                    Feed(providerService),
                    Add(),
                    Favorite(providerService),
                    Profile(providerService),
                  ],
                ),
              ),
            ),
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
                  icon: Stack(
                    children: <Widget>[
                      new Icon(Icons.favorite),
                      Positioned(
                        // top: 10,
                        right: 0,
                        child: providerService.getCounter() != 0
                            ? Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    providerService.getCounter().toString(),
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(),
                      )
                    ],
                  ),
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
          );
        }),
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
