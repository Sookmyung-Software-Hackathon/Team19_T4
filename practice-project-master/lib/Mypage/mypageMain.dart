import 'package:T4/Mypage/mypageEdit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:percent_indicator/percent_indicator.dart';

import 'myReviewPage.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
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
                                IconButton(onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyPageEdit()),
                                  );
                                }, icon: Icon(Icons.edit))
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
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: (){
                            // TODO 후기보기 동작 넣기
                            print("후기 보기");
                            //Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyReviewPage()),
                            );

                          },
                          child: Text("후기 보기 >",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800,

                            ),
                          ),
                        )

                      ),
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
            GestureDetector(
              onTap: () {
                print("진행 중인 밥 때");
              },
              child: Container(
                  height: 100,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    border: Border.all(
                      color: Color(0xffFF5D5D),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin:EdgeInsets.only(bottom: 5),
                              child: Text("진행중인 밥 때 [3]",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )

                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //margin: EdgeInsets.only(left: 15.0),
                            child: Text("15:30",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w800,
                              ),),
                          ),
                          Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //     color: Color(0xffFF5D5D),
                            //     width: 1,
                            //   ),
                            // ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width - 250,
                            margin: EdgeInsets.only(left: 15.0, right: 30.0),
                            child: Text("청파동 신내떡",
                              maxLines:1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),),
                          )
                        ],
                      )
                    ],
                  )
              ),
            ),

            GestureDetector(
              onTap: () {
                print("hello1");
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 30, left: 30.0, right: 30.0),
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(
                    color: Color(0xff333333),
                    width: 1.5,
                  ),
                ),
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("대기중인 밥 때 목록",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffFF5D5D),
                          size: 25,
                        )
                      ],
                    )
                ),

              ),
            ),



            GestureDetector(
              onTap: () {
                print("hello1");
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 15, left: 30.0, right: 30.0),
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(
                    color: Color(0xff333333),
                    width: 1.5,
                  ),
                ),
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("내가 참여한 밥 때 목록",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffFF5D5D),
                          size: 25,
                        )
                      ],
                    )
                ),

              ),
            ),

            GestureDetector(
              onTap: () {
                print("hello1");
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 15, left: 30.0, right: 30.0, bottom: 80.0),
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(
                    color: Color(0xff333333),
                    width: 1.5,
                  ),
                ),
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("내가 쓴 밥 때 목록",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffFF5D5D),
                          size: 25,
                        )
                      ],
                    )
                ),

              ),
            ),

          ],
        ),
      )
    );
  }
}
