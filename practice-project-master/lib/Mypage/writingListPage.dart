import 'package:T4/Login/login.dart';
import 'package:T4/Mypage/mypageEdit.dart';
import 'package:T4/Mypage/mypageMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../color.dart';
import '../mainBoard/readBoard.dart';

class WritingListPage extends StatefulWidget {

  final List<UserWritingList> writingList;

  const WritingListPage({Key? key, required this.writingList}) : super(key: key);

  @override
  State<WritingListPage> createState() => _WritingListPageState();
}

class _WritingListPageState extends State<WritingListPage> {
  var _data;
  var _userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            children: [
              Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      },
                          icon: Icon(Icons.arrow_back_ios_new_rounded)),
                      Spacer(),
                    ],
                  )
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                        padding:
                        EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                        child: Column(
                          children: [
                            ...List.generate(widget.writingList.length,
                                    (idx) => Container(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  ReadBoardPage(data: _data, userData: _userData,)));
                                    },
                                    child: Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            13 /
                                            100,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF),
                                          border: Border(
                                              bottom: BorderSide(
                                                color: Color(0xff999999),
                                                width: 1.0,
                                              )),
                                        ),
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(Icons
                                                              .restaurant_menu_outlined,
                                                            size: 22.0,
                                                            color: Color(0xff999999),),
                                                          Padding(
                                                              padding:
                                                              EdgeInsets
                                                                  .all(
                                                                  2.0)),
                                                          Text(
                                                              '${widget.writingList[idx].postTitle}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  16.0,
                                                                  color: Color(
                                                                      0xff333333),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600))
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              bottom: 4.0)),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            color: Color(
                                                                greenColor),
                                                            size: 20.0,
                                                          ),
                                                          Text('${widget.writingList[idx].restaurant}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  14.0,
                                                                  color: Color(
                                                                      0xff333333)))
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              bottom: 4.0)),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left: 2.0)),
                                                          Icon(
                                                            Icons
                                                                .schedule_outlined,
                                                            size: 16.0,
                                                            color: Color(
                                                                0xff666666),
                                                          ),
                                                          Padding(
                                                              padding:
                                                              EdgeInsets
                                                                  .all(
                                                                  2.0)),
                                                          Text(
                                                            '${widget.writingList[idx].time.substring(0,4)}.${widget.writingList[idx].time.substring(5,7)}.${widget.writingList[idx].time.substring(8,10)} ${widget.writingList[idx].time.substring(11,13)}:${widget.writingList[idx].time.substring(14,16)}',
                                                            style: TextStyle(
                                                                fontSize:
                                                                14.0,
                                                                color: Color(
                                                                    0xff666666)),
                                                          ),
                                                        ],
                                                      )
                                                    ]),
                                                Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        width: 18.0,
                                                        margin:
                                                        EdgeInsets.only(
                                                            right: 3.0),
                                                        child: Image.asset(
                                                            'images/promise.png'),
                                                      ),
                                                      Text(
                                                        "${widget.writingList[idx].checkNum}/${widget.writingList[idx].num}",
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            color: Color(
                                                                0xff333333)),
                                                      ),
                                                    ])
                                              ],
                                            ))),
                                  ),
                                ))
                          ],
                        )),
                  )
              )
            ],
          ),
        )
      ),
    );
  }
}
