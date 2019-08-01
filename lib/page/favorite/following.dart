import 'package:flutter/material.dart';
import 'package:twosuk/provider/provider_service.dart';

class Following extends StatefulWidget {
  final ProviderService providerService;

  @override
  State<StatefulWidget> createState() {
    return _FollowingState();
  }

  Following(this.providerService);
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              widget.providerService.decrementCounter();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 30,
              width: 30,
              child: Icon(Icons.remove_circle_outline,size: 30,),
            ),
          ),
          GestureDetector(
            onTap: (){
              widget.providerService.incrementCounter();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 30,
              width: 30,
              child: Icon(Icons.add_circle_outline,size: 30,),
            ),
          )
        ],
      ),

    );
  }
}