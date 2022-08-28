import 'package:T4/Mypage/mypageEdit.dart';
import 'package:T4/Mypage/participationListPage.dart';
import 'package:T4/Mypage/waitingListPage.dart';
import 'package:T4/Mypage/writingListPage.dart';
import 'package:T4/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:percent_indicator/percent_indicator.dart';

import '../Login/login.dart';
import '../Login/refreshToken.dart';
import 'myReviewPage.dart';


class ReviewList1 {
  final int Score;
  final String reviewStr;

  ReviewList1(this.Score, this.reviewStr);
}

class ReviewList2 {
  final int Score;
  final String reviewStr;

  ReviewList2(this.Score, this.reviewStr);
}

class UserWritingList {
  final int postId;
  final String postTitle;
  final String time;
  final String restaurant;
  final int num;
  final int checkNum;

  UserWritingList(this.postId, this.postTitle, this.time, this.restaurant, this.num, this.checkNum);
}

class MyPage extends StatefulWidget {

  final String imgURL;
  final String userName;
  final String introduce;

  final String mbti;
  final int age;
  final String sex;

  // 배부름 지수
  final int score;

  final String place;
  final String time;

  // 진행 중인 밥 때 시간 [list]
  // 진행 중인 밥 때 수
  // 진행 중인 밥 때 장소


  const MyPage({Key? key, required this.imgURL, required this.userName, required this.introduce, required this.mbti, required this.age, required this.sex, required this.score, required this.place, required this.time}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  final reviewlist1 = new List<ReviewList1>.empty(growable: true);
  final reviewlist2 = new List<ReviewList2>.empty(growable: true);

  final writingList = new List<UserWritingList>.empty(growable: true);
  final waitingList = new List<UserWritingList>.empty(growable: true);
  final participateList = new List<UserWritingList>.empty(growable: true);

  void writtenListInfo() async {

    var url = Uri.http('${serverHttp}:8080', '/review/target');

    var response = await http.get(url, headers: {'Accept': 'application/json', "content-type": "application/json", "X-AUTH-TOKEN": "${authToken}" });

    print(url);
    print("response: ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      dynamic data = body["response"];

      print("${data}");
      reviewlist1.clear();
      if(data.length != 0){
        for(dynamic i in data){
          int a = i["score"];
          String b = i["comment"];
          reviewlist1.add(ReviewList1(a, b));
        }
      }

      print("reviewList1: ${reviewlist1}");

      writingListInfo();
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (_) => my)
      // );

      // urlInfo(letter, letterId);

    }
    else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        writtenListInfo();
        check = false;
      }
    }
    else {
      print('error : ${response.reasonPhrase}');
    }

  }

  void userWaitingList() async {

    var url = Uri.http('${serverHttp}:8080', '/member/plan/scheduled');

    var response = await http.get(url, headers: {'Accept': 'application/json', "content-type": "application/json", "X-AUTH-TOKEN": "${authToken}" });

    print(url);
    print("response: ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      dynamic data = body["response"];

      data = data["list"];

      waitingList.clear();
      if(data.length != 0){
        for(dynamic i in data){
          int a = i["postId"];
          String b = i["postTitle"];
          String c = i["appointmentTime"];
          String d = i["restaurant"];
          int e = i["numOfParticipants"];
          int f = i["numOfPermittedMember"];
          waitingList.add(UserWritingList(a, b, c, d, e, f));
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WaitingListPage(waitingList: waitingList,)),
      );


      //print(data);
      //
      // reviewlist2.clear();
      // if(data.length != 0){
      //   for(dynamic i in data){
      //     int a = i["score"];
      //     String b = i["comment"];
      //     reviewlist2.add(ReviewList2(a, b));
      //   }
      // }

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (_) => MyReviewPage(score: widget.score, reviewList1: reviewlist1, reviewList2: reviewlist2))
      // );

      // urlInfo(letter, letterId);

    }
    else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        userWritingList();
        check = false;
      }
    }
    else {
      print('error : ${response.reasonPhrase}');
    }

  }

  void userWritingList() async {

    var url = Uri.http('${serverHttp}:8080', '/member/posts');

    var response = await http.get(url, headers: {'Accept': 'application/json', "content-type": "application/json", "X-AUTH-TOKEN": "${authToken}" });

    print(url);
    print("response: ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      dynamic data = body["response"];

      data = data["list"];

      writingList.clear();
      if(data.length != 0){
        for(dynamic i in data){
          int a = i["postId"];
          String b = i["postTitle"];
          String c = i["appointmentTime"];
          String d = i["restaurant"];
          int e = i["numOfParticipants"];
          int f = i["numOfPermittedMember"];
          writingList.add(UserWritingList(a, b, c, d, e, f));
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WritingListPage(writingList: writingList)),
      );


      //print(data);
      //
      // reviewlist2.clear();
      // if(data.length != 0){
      //   for(dynamic i in data){
      //     int a = i["score"];
      //     String b = i["comment"];
      //     reviewlist2.add(ReviewList2(a, b));
      //   }
      // }

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (_) => MyReviewPage(score: widget.score, reviewList1: reviewlist1, reviewList2: reviewlist2))
      // );

      // urlInfo(letter, letterId);

    }
    else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        userWritingList();
        check = false;
      }
    }
    else {
      print('error : ${response.reasonPhrase}');
    }

  }

  void userParticipateList() async {

    var url = Uri.http('${serverHttp}:8080', '/plan/permitted/list');

    var response = await http.get(url, headers: {'Accept': 'application/json', "content-type": "application/json", "X-AUTH-TOKEN": "${authToken}" });

    print(url);
    print("response: ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      dynamic data = body["response"];

      data = data["list"];

      participateList.clear();
      if(data.length != 0){
        for(dynamic i in data){
          int a = i["postId"];
          String b = i["postTitle"];
          String c = i["appointmentTime"];
          String d = i["restaurant"];
          int e = i["numOfParticipants"];
          int f = i["numOfPermittedMember"];
          participateList.add(UserWritingList(a, b, c, d, e, f));
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ParticipationListPage(participationList: participateList,)),
      );


    }
    else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        userParticipateList();
        check = false;
      }
    }
    else {
      print('error : ${response.reasonPhrase}');
    }

  }

  void writingListInfo() async {

    var url = Uri.http('${serverHttp}:8080', '/review/writer');

    var response = await http.get(url, headers: {'Accept': 'application/json', "content-type": "application/json", "X-AUTH-TOKEN": "${authToken}" });

    print(url);
    print("response: ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      dynamic data = body["response"];

      reviewlist2.clear();
      if(data.length != 0){
        for(dynamic i in data){
          int a = i["score"];
          String b = i["comment"];
          reviewlist2.add(ReviewList2(a, b));
        }
      }

      print("vowelList: ${reviewlist2}");

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => MyReviewPage(score: widget.score, reviewList1: reviewlist1, reviewList2: reviewlist2))
      );

      // urlInfo(letter, letterId);

    }
    else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        writingListInfo();
        check = false;
      }
    }
    else {
      print('error : ${response.reasonPhrase}');
    }

  }


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
                            //padding: EdgeInsets.only( top: 20),
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
                                        builder: (context) => MyPageEdit(name: widget.userName, imageURL: widget.imgURL, mbti: widget.mbti, introduction: widget.introduce,)),
                                  );
                                }, icon: Icon(Icons.edit))
                              ],
                            )
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "${widget.imgURL}",
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
                              Text("${widget.userName}",
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
                          child: Text("${widget.introduce}",
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
                                        "${widget.mbti}",
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
                                      "${widget.age}",
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
                                      "${widget.sex}",
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
                        Text("${widget.score}",
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
                            writtenListInfo();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => MyReviewPage()),
                            // );

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
                        percent: widget.score / 100,
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
                              child: Text("진행중인 밥 때",
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
                            child: Text("${widget.time}",
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
                            child: Text("${widget.place}",
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
                userWaitingList();
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
                userParticipateList();
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
                userWritingList();
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
