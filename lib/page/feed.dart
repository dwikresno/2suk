import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twosuk/model/content_model.dart';
import 'package:twosuk/model/new_model.dart';
import 'package:twosuk/model/photo_dart.dart';
import 'package:twosuk/provider/provider_service.dart';
import 'package:twosuk/service/service.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Feed extends StatefulWidget {
  final ProviderService providerService;

  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }

  Feed(this.providerService);
}

class _FeedState extends State<Feed> with AutomaticKeepAliveClientMixin {
  var colorTab = Colors.deepOrange[700];
  Future getData;
  var isLostConnection = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isLostConnection = false;
    });
    _checkConnection();
    super.initState();
  }

  _checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isLostConnection = true;
      });
    } else {
      setState(() {
        getData = widget.providerService.getPhoto();
        isLostConnection = false;
      });
    }
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   // I am connected to a mobile network.
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   // I am connected to a wifi network.
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: logo(),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.search, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: isLostConnection
          ? _offline()
          : FutureBuilder<PhotoModel>(
              key: UniqueKey(),
              future: getData,
              builder: (context, snapshot) {
                Widget centerLoading = Center(
                  child: CircularProgressIndicator(),
                );
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return centerLoading;
                  } else {
                    return banner(snapshot.data.photos);
                  }
                } else {
                  return centerLoading;
                }
              },
            ),
      floatingActionButton: IconButton(
        onPressed: () {
          setState(() {
            _checkConnection();
          });
        },
        icon: Icon(Icons.refresh),
      ),
    );
  }

  Widget _offline() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('./assets/images/offline.png'),
          Text(
            'Oops, sepertinya anda \n sedang offline',
            textAlign: TextAlign.center,
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _checkConnection(),
          )
        ],
      ),
    );
  }

  Widget banner(List<PhotosModel> photos) {
    // print(bl[0].image);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return photos[index].avatar != null
                ? Card(
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                            ),
                            child: FadeInImage(
                              image: NetworkImage(photos[index].avatar),
                              width: double.infinity,
                              // height: screenAwareSize(100.0, context),
                              fit: BoxFit.fill,
                              placeholder:
                                  AssetImage('assets/images/no_image.jpg'),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(photos[index].firstName),
                              ),
                              Container(
                                child: Text(photos[index].email),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
                : Container();
          },
        ),
      ),
    );
  }

  Widget logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Feed',
          style: TextStyle(
            color: Colors.green,
            fontSize: 26,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
