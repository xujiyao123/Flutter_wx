import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wx/Demo/friendmodel_entity.dart';

class FriendCell extends StatefulWidget {

  FriendmodelData model;

  FriendCell({this.model});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FriendCellState();
  }

}
class FriendCellState extends State<FriendCell> {

  Widget makePictureCount(List<String> pics) {
    if (pics.length == 1) {
      return  Container(
          margin: EdgeInsets.fromLTRB(0, 10, 50, 10),
          child: Image.asset("lib/Resourse/" + pics[0]  , fit: BoxFit.fill,),
      );
    } else if (pics.length == 4 || pics.length == 2) {
      return Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.start,
            children: pics.map((p) => Image.asset("lib/Resourse/" + p , width: 100 , height: 100 , fit: BoxFit.cover,)).toList()
          )
      );
    } else if (pics.length == 3 || pics.length > 4) {
      return Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.start,
            children: pics.map((p) => Image.asset("lib/Resourse/" + p , width: 70 , height: 70 , fit: BoxFit.cover,)).toList()
          )
      );
    }
  }

  double _width = 0;
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0XFFFEFFFE),
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: ClipRRect(
                  child: Image.asset("lib/Resourse/" + widget.model.head , fit: BoxFit.fill,),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 70, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.model.name , style: TextStyle(fontSize: 17 , color: Color(0XFF566B94) , fontWeight: FontWeight.w500),),
                          SizedBox(height: 5,),
                          Text(widget.model.desc , style: TextStyle(fontSize: 15),),
                          makePictureCount(widget.model.pics),

                        ],
                      )
                  )
              )

            ],
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(

                  margin: EdgeInsets.only(left: 70),
                  child: Text(widget.model.time , style: TextStyle(fontSize: 12 , color: Color(0XFFB2B2B2)),),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child:    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0XFF4C5154)
                        ),
                        duration: Duration(milliseconds: 100),
                        width: _width,
                        height: 30,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Expanded(
                              flex : 1 ,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.favorite_border , color: Colors.white, size: 15,),
                                  SizedBox(width: 5,),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        _starCount ++ ;
                                        isShow();
                                      });
                                    },
                                    child:  Text("赞" ,style: TextStyle(color: Colors.white , fontSize: 12),)
                                  )

                                ],
                              )
                            ),
                            Expanded(
                              flex: 1,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.sms , color: Colors.white, size: 15,),
                                    SizedBox(width: 5,),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _talkCount ++ ;
                                          isShow();
                                        });
                                      },
                                      child:  Text("评论" ,style: TextStyle(color: Colors.white , fontSize: 12),)
                                    )

                                  ],
                                )
                            )
                          ],
                        )
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                          onTap: (){
                            isShow();
                          },
                          child: Image.asset("lib/Resourse/button.png" , width: 22, height: 18,)
                      ),
                    ],
                  ),
                )



              )
            ],
          ),
          Offstage(
            offstage: _starCount == 0 ? true : false,
            child: Container(
              constraints: BoxConstraints(
                minWidth: double.infinity
              ),
              margin: EdgeInsets.fromLTRB(70, 10, 15, 0),
              padding: EdgeInsets.all(5),
              color: Color(0XFFF3F3F5),
              child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 5,
                spacing: 5,
                children:likeView(_starCount)
              ),
            ),
          ),
          Offstage(
            offstage: _talkCount == 0 ? true : false,
            child: Container(
              constraints: BoxConstraints(
                  minWidth: double.infinity
              ),
              margin: EdgeInsets.fromLTRB(70, 0, 15, 0),
              padding: EdgeInsets.all(5),
              color: Color(0XFFF3F3F5),
              child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 5,
                  spacing: 5,
                  children:talkView(_talkCount)
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(height: 0.5, width: double.infinity, color: Colors.black26,)
        ],
      )



    );
  }

  void isShow() {
    _isShow = !_isShow;
    setState(() {
      _width = _isShow ? 120 : 0;
    });
  }

  var _starCount = 0;
  var _talkCount = 0;

 List<Widget> likeView(int count) {

   List<Widget> result = [];
   for (int i =0 ; i< count ; i ++) {
     result.add(Container(
       width: 70,
       child: Row(
         children: <Widget>[
           Icon(Icons.favorite_border , size: 13, color: Color(0XFF566B94),),
           SizedBox(width: 5,),
           Text("sunnytu" ,style: TextStyle(color: Color(0XFF566B94) , fontSize: 15 , fontWeight: FontWeight.w500),)
         ],
       ),
     ));
   }

    return  result;
  }

  List<Widget> talkView(int count) {

    List<Widget> result = [];
    for (int i =0 ; i< count ; i ++) {
      result.add(Container(
        child: Row(
          children: <Widget>[

            Expanded(
                child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: "sunnytu：",
                            style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.w500 , color: Color(0XFF566B94))
                        ),
                        TextSpan(
                          text: "66666",
                          style: TextStyle(fontSize: 14),
                        )
                      ]
                  ),
                  textAlign: TextAlign.start,
                )
            ),


          ],
        ),
      ));
    }

    return  result;
  }

}