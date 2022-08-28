import 'package:T4/Mypage/mypageMain.dart';
import 'package:T4/mainBoard/createBoard.dart';
import 'package:T4/mainBoard/readBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:T4/color.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Login/login.dart';
import '../Login/refreshToken.dart';
import '../server.dart';

class MainBoardPage extends StatefulWidget {
  const MainBoardPage({Key? key}) : super(key: key);

  @override
  State<MainBoardPage> createState() => _MainBoardPageState();
}

class _MainBoardPageState extends State<MainBoardPage> {
  final _regionList = [
    '종로구',
    '중구',
    '용산구',
    '성동구',
    '광진구',
    '동대문구',
    '중랑구',
    '성북구',
    '강북구',
    '도봉구',
    '노원구',
    '은평구',
    '서대문구',
    '마포구',
    '양천구',
    '강서구',
    '구로구',
    '금천구',
    '영등포구',
    '동작구',
    '관악구',
    '서초구',
    '강남구',
    '송파구',
    '강동구'
  ];
  String _selectRegion = '용산구';

  String imgUrl = "";
  String userName = "";
  String introduce = "";
  String mbti = "";

  int age = 0;
  String sex = "";

  int score = 0;

  // 서버 연결
  void userInfo() async {
    var url = Uri.http('${serverHttp}:8080', '/member/info');

    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      "content-type": "application/json",
      "X-AUTH-TOKEN": "${authToken}"
    });

    print(url);
    print("Bearer ${authToken}");
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      var data = body["response"];
      print("data: ${data}", );
      imgUrl = data["imgUrl"].toString();
      userName = data["name"].toString();

      var profileDto = data["profileDto"];
      print(profileDto);
      // age = profileDto["birthYear"];
      // age = 2023 - age;
      //
      // sex = profileDto["sex"].toString();
      //
      // if(sex == "FEMALE"){
      //   sex = "여성";
      // }else{
      //   sex = "남성";
      // }
      //
      // mbti = profileDto["mbti"].toString();
      //
      // if(profileDto["introduction"] == null){
      //   introduce = "";
      // }
      // else{
      //   introduce = profileDto["introduction"].toString();
      // }
      //
      // score = profileDto["score"];
      //
      // print (imgUrl);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyPage(imgURL: imgUrl, userName: userName, introduce: introduce, mbti: mbti, age: age, sex: sex, score: score,)),
      );

      // name = data["name"].toString();
    } else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        userInfo();
        check = false;
      }
    }
    else {

      print('error : ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Color(0xffffffff),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 50.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Color(greenColor),
                              size: 32.0,
                            ),
                          ),
                          // Padding(padding: EdgeInsets.all(2.0)),
                          Container(
                            // width: MediaQuery.of(context).size.width*25/100,
                            // height: MediaQuery.of(context).size.height *
                            //     7 /
                            //     100,
                            child: DropdownButton(
                              // isExpanded: true,
                              value: _selectRegion,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectRegion = newValue as String;
                                });
                              },
                              // underline: Container(
                              //   height: 2,
                              //   color: Color(greenColor),
                              // ),
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              items: _regionList.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xff333333),
                                          fontWeight: FontWeight.w600)),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.notifications_none_outlined,
                              size: 35.0,
                            ),
                          )),
                          Container(
                              child: InkWell(
                            onTap: () {
                              userInfo();
                            },
                            child: Icon(
                              Icons.account_circle_outlined,
                              color: Color(greenColor),
                              size: 35.0,
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                      padding:
                          EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                      child: Column(
                        children: [
                          ...List.generate(
                              10,
                              (idx) => Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ReadBoardPage()));
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
                                                                '마라탕 먹으러 가실 분 구합니다.',
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
                                                            Text('탕화쿵푸 숙대점',
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
                                                              '2022.08.28 13:00',
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
                                                          "1/2",
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
                )),
              ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateBoardPage()));
        },
        backgroundColor: Color(greenColor),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
