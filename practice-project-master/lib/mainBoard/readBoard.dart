import 'dart:convert';
import 'package:T4/Login/login.dart';
import 'package:http/http.dart' as http;
import 'package:T4/mainBoard/userProfilePage.dart';
import 'package:T4/server.dart';
import 'package:flutter/material.dart';

import 'package:T4/color.dart';

class ReadBoardPage extends StatefulWidget {
  final Map data;
  final Map userData;
  const ReadBoardPage({Key? key, required this.data, required this.userData}) : super(key: key);

  @override
  State<ReadBoardPage> createState() => _ReadBoardPageState();
}

class _ReadBoardPageState extends State<ReadBoardPage> {
  late var dataMap=widget.data;
  late var userDataMap=widget.userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Color(0xffffffff),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  height: MediaQuery.of(context).size.height*7/100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Color(0xff333333),
                        ),
                      )
                    ],
                  )),
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Container(
                        padding: EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 5.0, bottom: 5.0),
                        height: MediaQuery.of(context).size.height * 9 / 100,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          border: Border(
                              bottom: BorderSide(
                                color: Color(0xff999999),
                                width: 1.0,
                              ),
                              top: BorderSide(
                                color: Color(0xff999999),
                                width: 1.0,
                              )),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    //TODO
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => userProfilePage()));
                                  },
                                  child: Container(
                                    //프로필 이미지
                                    width: 50.0,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        userDataMap['imgUrl'],
                                      ),
                                      radius: 100.0,
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      userDataMap['name'],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff333333)),
                                    ),
                                    Padding(padding: EdgeInsets.all(2.0)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          userDataMap['profileDto']['sex']=="FEMALE"? '여, ': '남, ',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xff666666)),
                                        ),
                                        Text(
                                            (2023-int.parse(userDataMap['profileDto']['birthYear'])).toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xff666666)),
                                        ),
                                      ],
                                    )

                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '배부름 지수',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff333333)),
                                ),
                                Padding(padding: EdgeInsets.all(2.0)),
                                Text(
                                  userDataMap['profileDto']['score'].toString(),
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff6ACC80)),
                                ),
                              ],
                            )
                          ],
                        )),
                    Container(
                        padding:
                            EdgeInsets.only(right: 30.0, left: 30.0, top: 20.0),
                        child: Column(children: [
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                dataMap['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: Color(0xff333333)),
                              )
                            ],
                          )),
                          Padding(padding: EdgeInsets.only(bottom: 20.0)),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 3, color: Color(greenColor)),
                            ),
                            padding: EdgeInsets.only(
                                right: 10.0,
                                left: 20.0,
                                bottom: 25.0,
                                top: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          27 /
                                          100,
                                      child: Text(
                                        "지역",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10.0)),
                                    Container(
                                        child: Text(dataMap['planInfo']['location'],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xff333333)))),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          27 /
                                          100,
                                      child: Text(
                                        '음식점 이름',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10.0)),
                                    Container(
                                        child: Text(dataMap['planInfo']['restaurant'],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xff333333)))),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          27 /
                                          100,
                                      child: Text(
                                        '음식 종류',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10.0)),
                                    Container(
                                        child: Text(dataMap['planInfo']['foodType'],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xff333333)))),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          27 /
                                          100,
                                      child: Text(
                                        '날짜 및 시간',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10.0)),
                                    Container(
                                        child: Text(dataMap['planInfo']['appointmentTime'],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xff333333)))),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          27 /
                                          100,
                                      child: Text(
                                        '모집 인원',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10.0)),
                                    Container(
                                        child: Text(dataMap['planInfo']['numOfParticipants'].toString(),
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xff333333)))),
                                  ],
                                ),
                                // Padding(padding: EdgeInsets.all(5.0)),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [
                                //     Container(
                                //       width: MediaQuery.of(context).size.width *
                                //           27 /
                                //           100,
                                //       child: Text(
                                //         '오픈 채팅방 링크',
                                //         style: TextStyle(
                                //             fontSize: 14.0,
                                //             color: Color(0xff333333),
                                //             fontWeight: FontWeight.w600),
                                //       ),
                                //     ),
                                //     Padding(padding: EdgeInsets.all(10.0)),
                                //     Container(
                                //         child: Text(dataMap['chatRoomLink'],
                                //             style: TextStyle(
                                //                 fontSize: 14.0,
                                //                 color: Color(0xff333333)))),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          Container(
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     // color: Color(0xfff0f0f0),
                              //     border: Border.all(
                              //         width: 2,
                              //         color: Color(greenColor))),
                              width:
                                  MediaQuery.of(context).size.width * 80 / 100,
                              height: 150.0,
                              child: Text(dataMap['content'],
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff333333))))
                        ])),
                  ])),
            ])),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(greenColor),
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
          child: Text(
            '같이 먹어요!',  //글쓴이이면 수정하기
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16.0),
          ),
          onPressed: () {
            // _requestMeal() //글의 아이디
          },
        ),
      ),
    );
  }

  _requestMeal(String id) async {
    var url = Uri.http('${serverHttp}:8080', '/registerHistory/new');

    final data = jsonEncode({'planId': id});

    var response = await http.post(url, body: data, headers: {
      'Accept': 'application/json',
      "content-type": "application/json",
      "X-AUTH-TOKEN": "${authToken}"
    });

    // print(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(response.body);
      dynamic data=body["response"];

      if(data["success"]==true){
        _showDialog("신청 성공", "신청이 성공하였습니다");
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  void _showDialog(String title, text) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}
