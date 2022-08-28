import 'package:T4/Mypage/mypageEdit.dart';
import 'package:T4/Mypage/mypageMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:percent_indicator/percent_indicator.dart';

class ReviewList {
  final int timeScore;
  final int kindScore;
  final String reviewStr;

  ReviewList(this.timeScore, this.kindScore, this.reviewStr);
}



class MyReviewPage extends StatefulWidget {

  // final int score;
  // final List<>

  const MyReviewPage({Key? key}) : super(key: key);

  @override
  State<MyReviewPage> createState() => _MyReviewPageState();
}

class _MyReviewPageState extends State<MyReviewPage> with TickerProviderStateMixin{

  final List<int> timeScores = <int>[5, 4, 2, 4, 3];
  final List<int> kindScores = <int>[1, 3, 4, 1, 5];

  final List<String> reviewStrs = <String>["안녕하세요", "좋았습니다", "없습니다.", "", ""];

  final List<int> timeScores2 = <int>[2, 1, 5, 4, 3];
  final List<int> kindScores2 = <int>[1, 3, 4, 1, 5];

  final List<String> reviewStrs2 = <String>["안녕하세요", "좋았습니다", "없습니다.", "", ""];


  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this, initialIndex: 0,);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

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

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child:  NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                foregroundColor: Color(0xff333333),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                            ],
                          )
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              color: Color(0xffFF5D5D),
                              width: 2,
                            )
                        ),
                        child: Row(
                          children: [
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

                            LinearPercentIndicator(
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
                        ),
                      ),

                    ],
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height /3 * 1,
                bottom: TabBar(
                  indicatorColor: Color(0xffFF5D5D),
                  labelColor: Color(0xffFD2323),
                  tabs: [
                    Tab(
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text("내가 받은 후기"),
                        )
                    ),
                    Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text("내가 쓴 후기"),
                        )
                    ),
                  ],
                  controller: _nestedTabController,
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _nestedTabController,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: ListView.builder(
                  itemCount: timeScores.length,
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
                        width: double.infinity,
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
                                  getScoreImage(timeScores[index])
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

                                  getScoreImage(kindScores[index])

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
                                    child: Text("${reviewStrs[index]}",
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
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: ListView.builder(
                  itemCount: timeScores2.length,
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
                          width: double.infinity,
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
                                    getScoreImage(timeScores2[index])
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

                                    getScoreImage(kindScores2[index])

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
                                      child: Text("${reviewStrs2[index]}",
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
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
