import 'package:flutter/material.dart';

import 'package:T4/color.dart';

class ReadMyBoardPage extends StatefulWidget {
  const ReadMyBoardPage({Key? key}) : super(key: key);

  @override
  State<ReadMyBoardPage> createState() => _ReadMyBoardPageState();
}

class _ReadMyBoardPageState extends State<ReadMyBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Color(0xffffffff),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Color(0xff333333),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.edit, color: Color(0xff333333),
                        ),
                      )
                    ],
                  )),
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Container(
                        padding:
                            EdgeInsets.only(right: 30.0, left: 30.0, top: 10.0),
                        child: Column(children: [
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "마라탕 먹으러 가실 분 구합니다",
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
                                          25 /
                                          100,
                                      child: Text(
                                        '지역',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10.0)),
                                    Container(
                                        child: Text("용산구",
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
                                          25 /
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
                                        child: Text("탕화쿵푸 숙대점",
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
                                          25 /
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
                                        child: Text("중식",
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
                                          25 /
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
                                        child: Text("2022/08/28 13:00",
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
                                          25 /
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
                                        child: Text("2",
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
                                          25 /
                                          100,
                                      child: Text(
                                        '오픈 채팅방 링크',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10.0)),
                                    Container(
                                        child: Text("",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xff333333)))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          Container(
                              width:
                                  MediaQuery.of(context).size.width * 80 / 100,
                              height: 100.0,
                              child: Text("저랑 마라탕 같이 먹어 주세요!",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff333333)))),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top:10.0, bottom:10.0),
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      // color: Color(0xfff0f0f0),
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Color(0xff999999)),
                                    // top: BorderSide(
                                        // width: 1, color: Color(0xff999999)),
                                  )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "신청 현황",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                            color: Color(0xff333333)),
                                      ),
                                      Text("[2/4]",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                              color: Color(0xff333333)))
                                    ],
                                  ),
                                ),
                                ...List.generate(
                                    2,
                                    (idx) => Container(
                                        child: InkWell(
                                            onTap: () {
                                              // Navigator.push(context,
                                              //     MaterialPageRoute(builder: (_) => ReadBoardPage()));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  right: 5.0,
                                                  left: 5.0,
                                                  top: 5.0,
                                                  bottom: 5.0),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  9 /
                                                  100,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFFFFFF),
                                                border: Border(
                                                    bottom: BorderSide(
                                                      color: Color(0xff999999),
                                                      width: 1.0,
                                                    ),
                                                    // top: BorderSide(
                                                    //   color: Color(0xff999999),
                                                    //   width: 1.0,
                                                    // )
                                                ),
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          //프로필 이미지
                                                          width: 50.0,
                                                          child: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                              "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                                                            ),
                                                            radius: 100.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(right:
                                                                    5.0)),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '눈송이님이 밥때를 희망합니다.',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xff333333)),
                                                            ),
                                                            Padding(padding: EdgeInsets.only(bottom:3.0)),
                                                            Text(
                                                              '16:00',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  color: Color(
                                                                      0xff999999)),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: (){},
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xff6ACC80),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              padding: EdgeInsets.only(top: 5.0, bottom:5.0, right:10.0, left:10.0),
                                                              margin: EdgeInsets.only(right:5.0),
                                                              child: Icon(Icons.done, color: Colors.white,))
                                                        ),
                                                        InkWell(
                                                          onTap: (){},
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffFF5555),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              padding: EdgeInsets.only(top: 5.0, bottom:5.0, right:10.0, left:10.0),

                                                              child: Icon(Icons.close, color: Colors.white,))
                                                        )
                                                      ],
                                                    )
                                                  ]),
                                            ))))
                              ],
                            ),
                          )
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
            '모집 완료', //글쓴이이면 수정하기
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16.0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
