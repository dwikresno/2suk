import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twosuk/model/content_model.dart';
import 'package:twosuk/model/new_model.dart';
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

  @override
  void initState() {
    
    // TODO: implement initState
    getData=widget.providerService.getNews();
    super.initState();
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
        body: FutureBuilder<NewsModel>(
          key: UniqueKey(),
          future: getData,
          builder: (context, snapshot) {
            Widget centerLoading = Center(
              child: CircularProgressIndicator(),
            );
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return centerLoading;
              } else {
                return Column(
                  children: <Widget>[
                    banner(snapshot.data.articles),
                  ],
                );
              }
            } else {
              return centerLoading;
            }
          },
        ),
        floatingActionButton:IconButton(
          onPressed: (){
            setState(() {
              
            });
          },
          icon: Icon( Icons.refresh),
        ) ,
       );
  }

  Widget banner(List<ArticlesModel> bl) {
    // print(bl[0].image);
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: bl.length,
        itemBuilder: (context, index) {
          return bl[index].urlToImage!=null?Card(
            elevation: 5,
            child: ListTile(
            leading: Image.network(bl[index].urlToImage),
            title: Text("asdsad"),
          ),
          ):Container();
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
