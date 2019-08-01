import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twosuk/model/content_model.dart';
// import 'package:toast/toast.dart';
import 'package:twosuk/page/home/fresh.dart';
import 'package:twosuk/page/home/hot.dart';
import 'package:twosuk/page/notify.dart';
import 'package:twosuk/provider/provider_service.dart';
// import 'package:twosuk/page/search.dart';

class Home extends StatefulWidget {
  final ProviderService providerService;

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

  Home(this.providerService);
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var colorTab = Colors.deepOrange[700];
  TabController controllerHome;

  @override
  void initState() {
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
    controllerHome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ContentModel>(
      future: widget.providerService.getContent(),
      builder: (context, snapshot) {
      if (widget.providerService.needUpdate) {
        return buildDialog(context);
      }
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 2,
            centerTitle: true,
            title: logo(),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Notify(),
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
    });
  }

  Widget buildDialog(BuildContext context) {
    Future.delayed(
        Duration.zero, () => widget.providerService.showVersionDialog(context));
    return Container();
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
