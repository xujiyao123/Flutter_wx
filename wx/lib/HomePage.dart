import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  ScrollController _scrollController = new ScrollController();

  double _alpha = 0;


  @override
  void initState() {
    super.initState();

    _scrollController.addListener((){

      double  alpha = _scrollController.offset/200;

       if (alpha < 0) {
         alpha  = 0;
       } else if (alpha > 1) {
         alpha = 1;
       }

       setState(() {
          _alpha = alpha;
       });


    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: CupertinoNavigationBar(middle: Text("wadhuwahd"),),
      body: Stack(
        children: <Widget>[
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              Image.asset("lib/Resourse/banner.jpg"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),
              Text("213"),

            ],
          ),
          Opacity(
            opacity: _alpha,
            child: CupertinoNavigationBar(
              middle: Text("朋友圈"),
            ),
          )
        ],
      ),
    );
  }

}

