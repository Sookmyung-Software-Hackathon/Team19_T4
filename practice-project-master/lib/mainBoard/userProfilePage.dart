import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:io';

import 'package:percent_indicator/percent_indicator.dart';

class userProfilePage extends StatefulWidget {
  const userProfilePage({Key? key}) : super(key: key);

  @override
  State<userProfilePage> createState() => _userProfilePageState();
}

class _userProfilePageState extends State<userProfilePage> {
  final List<int> timeScores3 = <int>[5, 4, 2, 4, 3];
  final List<int> kindScores3 = <int>[1, 3, 4, 1, 5];

  final List<String> reviewStrs3 = <String>["안녕하세요", "좋았습니다", "없습니다.", "", ""];

  Widget getScoreImage(score){
    if(score == 1){
      return Image.asset('images/score1.png', width: 120,);
    }
    else if(score == 2){
      return Image.asset('images/score2.png', width: 120,);
    }
    else if(score == 3){
      return Image.asset('images/score3.png', width: 120,);
    }
    else if(score == 4){
      return Image.asset('images/score4.png', width: 120,);
    }
    else if(score == 5){
      return Image.asset('images/score5.png', width: 120,);
    }
    return Image.asset('images/score5.png', width: 120,);
  }

  Widget listview_builder() {
    return ListView.builder(
      itemCount: timeScores3.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.only(bottom: 25.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          //color: index % 2 == 0 ? Colors.blue : Colors.green,
          color: Color(0xffEEEEEE),
          child: Container(
              padding: EdgeInsets.all(25),
              //alignment: Alignment.center,
              //width: 330,
              height: 250.0,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("시간 약속을 잘 지켜요",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 12.0,
                          ),
                        ),
                        getScoreImage(timeScores3[index])
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("시간 약속을 잘 지켜요",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 12.0,
                          ),
                        ),

                        getScoreImage(kindScores3[index])

                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text("어떤 점이 좋았나요?",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12.0,
                              ),
                            ),
                            Spacer(),
                            Text("[선택]",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 15),
                          height: 90.0,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Text("${reviewStrs3[index]}",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  )

                ],
              )
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffFF8C8C), Color(0xffFFC3C3)]
                        , stops: [0.3, 0.7 ],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      )
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
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
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://user-images.githubusercontent.com/61380136/187037733-a81beb82-721e-4ed2-a05d-7a7fbda7d98d.png",
                            ),
                            radius: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("김도은",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff333333),

                                  ),
                                ),

                                // TODO - icon button 추가하기
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text("저는 혼자 밥 먹는 것을 좋아합니다.",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff111111),
                                    fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            clipBehavior: Clip.antiAlias,

                            color: Colors.white,
                            elevation: 8.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 22.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "MBTI",
                                          style: TextStyle(
                                            color: Color(0xffFD2323),
                                            fontSize:18.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "ENTJ",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Color(0xff333333),
                                              fontWeight: FontWeight.w600
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  Expanded(child: Column(
                                    children: <Widget>[
                                      Text(
                                        "나이",
                                        style: TextStyle(
                                          color: Color(0xffFD2323),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "23",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff333333),
                                        ),
                                      )
                                    ],
                                  )),

                                  Expanded(child: Column(
                                    children: <Widget>[
                                      Text(
                                        "성별",
                                        style: TextStyle(
                                          color: Color(0xffFD2323),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "여",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff333333),
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),

              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
                // 배부름 지수
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15.0),
                      child: Image.asset('images/fork.png'),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: [
                          Text("배부름 지수",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14.0,
                            ),
                          ),
                          Text("80",
                            style: TextStyle(
                              color: Color(0xff6ACC80),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget> [
                        new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 200,
                          animation: true,
                          lineHeight: 10.0,
                          animationDuration: 2500,
                          percent: 0.8,
                          //center: Text("80.0%"),
                          barRadius: const Radius.circular(15),
                          progressColor: Color(0xff6ACC80),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10),
                    child: Text("최근 받은 후기",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
                height: MediaQuery.of(context).size.height-150,
                margin: EdgeInsets.only(top: 10.0),
                  child: listview_builder()
              )


            ],

          ),
        )
    );
  }
}
