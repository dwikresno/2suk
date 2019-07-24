import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twosuk/page/favorite/following.dart';
import 'package:twosuk/page/favorite/you.dart';

class Favorite extends StatefulWidget {
  Favorite({Key key}) : super(key: key);

  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite>
    with SingleTickerProviderStateMixin {
  TabController controllerFavorite;

  @override
  void initState() {
    controllerFavorite = TabController(vsync: this, length: 2, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    controllerFavorite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: TabBar(
            controller: controllerFavorite,
            onTap: (index) {
              setState(() {
                // index == 0
                //     ? colorTab = Colors.deepOrange[700]
                //     : colorTab = Colors.blue;
              });
            },
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            labelColor: Colors.black,
            labelPadding: EdgeInsets.all(10),
            indicatorWeight: 1.5,
            tabs: [
              Tab(text: 'Following'),
              Tab(text: 'You'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controllerFavorite,
        // physics: ScrollableScrollPhysics(),
        children: [
          Following(),
          You(),
        ],
      ),
    );
  }
}
