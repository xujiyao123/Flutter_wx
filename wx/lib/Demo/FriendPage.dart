import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wx/Demo/FriendCell.dart';
import 'package:wx/Demo/HeaderView.dart';
import 'package:wx/Demo/friendmodel_entity.dart';

class FriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FriendPageState();
  }
}

class _FriendPageState extends State<FriendPage> {
  ScrollController _scrollController = new ScrollController();
  double _opacity = 0;

  FriendmodelEntity _friendmodelEntity = FriendmodelEntity();

  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/Resourse/Data.json');
  }

    @override
  void initState() {
    super.initState();

    loadAsset().then((value){
      var json = jsonDecode(value);
      _friendmodelEntity = FriendmodelEntity.fromJson(json);
      setState(() {});
    });


    _scrollController.addListener(() {

      double alph = _scrollController.offset/200;
       if (alph < 0) {
         alph = 0;
       } else if (alph > 1) {
         alph = 1;
       }
       setState(() {
         _opacity = alph;
       });


    });

  }

  Widget _mainListViewBuidler(BuildContext context , int index) {
    return FriendCell(model: _friendmodelEntity.data[index],);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 0),
            controller: _scrollController,
            children: <Widget>[
              HeaderView(),
             ListView.builder(padding: EdgeInsets.only(top: 0), itemBuilder: _mainListViewBuidler , itemCount: _friendmodelEntity.data.length, shrinkWrap: true, physics:NeverScrollableScrollPhysics(),)
            ],
          ),
          Opacity(
            opacity: _opacity,
              child: CupertinoNavigationBar(
                middle: Text("朋友圈"),

            ),
          )

        ],

      ),
    );
  }
}
