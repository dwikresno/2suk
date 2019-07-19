import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:twosuk/profile/comment.dart';
import 'package:twosuk/profile/post.dart';
import 'package:twosuk/profile/vote.dart';
import 'package:twosuk/widget.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  with SingleTickerProviderStateMixin {
  TabController controllerProfile;

  @override
  void initState() {
    controllerProfile = TabController(vsync: this, length: 3, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    controllerProfile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'dwikresno11',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              showConfig(context);
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                expandedHeight: 200,
                backgroundColor: Colors.white,
                // title: profile(),
                flexibleSpace: FlexibleSpaceBar(
                  background: profile(),
                ),
                floating: true,
                pinned: true,
                snap: true,
                bottom: new TabBar(
                  controller: controllerProfile,
                  onTap: (index) {
                    print("tab all index ke $index");
                  },
                  isScrollable: false,
                  tabs: [
                    Tab(
                      icon: new Icon(Icons.grid_on),
                    ),
                    Tab(
                      icon: new Icon(FontAwesomeIcons.thumbsUp),
                    ),
                    Tab(
                      icon: new Icon(FontAwesomeIcons.commentDots),
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
              ),
            ];
          },
          body: new Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: controllerProfile,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Post(),
                Vote(),
                Comment(),
              ],
            ),
          )),
    );
  }

  Widget profile() {
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                height: 70,
                width: 70,
                child: Center(
                  child: Image.asset(
                    'assets/images/avatar-6.jpg',
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        '200',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        'Posts',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        '200',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        'Followers',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        '200',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        'Following',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20),
                child: OutlineButton(
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop(context);
                  }, //callback when button is clicked
                  borderSide: BorderSide(
                    color: Colors.green, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: OutlineButton(
                  child: const Text(
                    'Promotion',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop(context);
                  }, //callback when button is clicked
                  borderSide: BorderSide(
                    color: Colors.green, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: OutlineButton(
                  child: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop(context);
                  }, //callback when button is clicked
                  borderSide: BorderSide(
                    color: Colors.green, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void showConfig(context) {
    showModalBottomSheet(
        backgroundColor:Color(0xFF737373),
        elevation: 1,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            height: MediaQuery.of(context).size.height * 0.9,
            child: new Wrap(
              children: <Widget>[
                WidgetCustom(),
                new ListTile(
                  leading: new Icon(Icons.link),
                  title: new Text('Copy Link'),
                  onTap: () => {},
                ),
                new ListTile(
                    leading: new Icon(Icons.report),
                    title: new Text('Report'),
                    onTap: () => {}),
              ],
            ),
          );
        });
  }
}
