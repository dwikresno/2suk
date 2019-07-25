import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  var pageSize = 3;
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isLostConnection = false;
    });
    // _checkConnection();
    super.initState();
  }

  _checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.none) {
      if (mounted)
        setState(() {
          isLostConnection = true;
        });
    } else {
      if (mounted)
        setState(() {
          getData = widget.providerService.getPhoto();
          isLostConnection = false;
          _refreshController.loadComplete();
        });
    }
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   // I am connected to a mobile network.
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   // I am connected to a wifi network.
    // }
  }

  void _onRefresh() async {
    // monitor network fetch
    if (mounted) _checkConnection();
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // if (mounted)
    //   setState(() {
    //     getData = widget.providerService.getPhoto();
    //   });
    
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) _checkConnection();

    _refreshController.loadComplete();
  }

  // void _finish() {
  //   _refreshController.refreshCompleted();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
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
      body: SmartRefresher(
        enablePullDown: true,
        // enablePullUp: true,
        header: WaterDropMaterialHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: isLostConnection
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
                      return Container();
                    } else {
                      return SingleChildScrollView(
                        child: PagewiseListView(
                          key: UniqueKey(),
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          pageSize: pageSize,
                          itemBuilder: cobaBanner,
                          pageFuture: (pageIndex) => widget.providerService
                              .getPhotoList(pageIndex + 1),
                          noItemsFoundBuilder: (context) {
                            return Center(
                              child: Container(
                                child: Text('Data not found'),
                              ),
                            );
                          },
                          loadingBuilder: (context) {
                            return centerLoading;
                          },
                          showRetry: false,
                          errorBuilder: (context, error) {
                            return Column(children: [
                              Expanded(child: Container()),
                              Text(
                                "Something went wrong",
                                style: TextStyle(color: Colors.white),
                              ),
                            ]);
                          },
                        ),
                      );
                    }
                  } else {
                    return Container();
                    // return centerLoading;
                  }
                },
              ),
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

  Widget cobaBanner(context, PhotosModel photos, _) {
    //  _refreshController.refreshCompleted();
    return photos.avatar != null
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
                      image: NetworkImage(photos.avatar),
                      width: double.infinity,
                      // height: screenAwareSize(100.0, context),
                      fit: BoxFit.fill,
                      placeholder: AssetImage('assets/images/no_image.jpg'),
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
                        child: Text(photos.firstName),
                      ),
                      Container(
                        child: Text(photos.email),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : Container();
  }

  Widget banner(List<PhotosModel> photos) {
    // print(bl[0].image);
    return Container(
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
