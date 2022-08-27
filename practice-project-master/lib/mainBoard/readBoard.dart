import 'package:flutter/material.dart';

import 'package:T4/color.dart';

class ReadBoardPage extends StatefulWidget {
  const ReadBoardPage({Key? key}) : super(key: key);

  @override
  State<ReadBoardPage> createState() => _ReadBoardPageState();
}

class _ReadBoardPageState extends State<ReadBoardPage> {
  final TextEditingController _title = new TextEditingController();
  late String _store;
  final TextEditingController _foodKind = new TextEditingController();
  final TextEditingController _people = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Color(0xffffffff),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '<',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 30),
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
                                    color: Color(greenColor),
                                    width: 1.0,
                                  ),
                                  top: BorderSide(
                                    color: Color(greenColor),
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
                                    Container(
                                      //프로필 이미지
                                      width: 50.0,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                                        ),
                                        radius: 100.0,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(5.0)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '눈송이',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff333333)),
                                        ),
                                        Text(
                                          '여, 20대 초반',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xff666666)),
                                        ),
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
                                    Text(
                                      '80',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff333333)),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding:
                            EdgeInsets.only(right: 30.0, left: 30.0, top: 5.0),
                            child: Column(children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xff999999),
                                        width: 1.0,
                                      )),
                                ),
                                child: TextFormField(
                                  controller: _title,
                                  decoration: InputDecoration(
                                      hintText: '제목',
                                      contentPadding: EdgeInsets.only(left: 10.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff999999),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(5.0)),
                              Container(
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  // color: Color(0xffF0F0F0),
                                  border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xff999999),
                                        width: 1.0,
                                      )),
                                  // border: Border.all(
                                  //   width: 2,
                                  //   color: Color(0xff999999)
                                  // )
                                ),
                                padding: EdgeInsets.only(
                                    right: 10.0, left: 10.0, bottom: 20.0),
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
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5.0)),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                50 /
                                                100,
                                            child: TextField(
                                              controller: _title,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  )),
                                            )),
                                      ],
                                    ),
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
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5.0)),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                50 /
                                                100,
                                            child: TextField(
                                              controller: _title,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  )),
                                            )),
                                      ],
                                    ),
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
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5.0)),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                50 /
                                                100,
                                            child: TextField(
                                              controller: _title,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  )),
                                            )),
                                      ],
                                    ),
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
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5.0)),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                50 /
                                                100,
                                            child: TextField(
                                              controller: _title,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  )),
                                            )),
                                      ],
                                    ),
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
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5.0)),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                50 /
                                                100,
                                            child: TextField(
                                              controller: _title,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  )),
                                            )),
                                      ],
                                    ),
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
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5.0)),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                50 /
                                                100,
                                            child: TextField(
                                              controller: _title,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xfff0f0f0),
                                                    ),
                                                  )),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Color(0xfff0f0f0),
                                      border: Border.all(
                                          width: 2, color: Color(0xff999999))),
                                  width:
                                  MediaQuery.of(context).size.width * 80 / 100,
                                  height: 150.0,
                                  child: TextField(
                                    controller: _title,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 10.0),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff0f0f0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff0f0f0),
                                          ),
                                        )),
                                  ))
                            ])),
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(primary: Color(greenColor)),
                        //       child: Text(
                        //         '작성하기',
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.w600,
                        //             color: Colors.white,
                        //             fontSize: 16.0),
                        //       ),
                        //       onPressed: () {},
                        //     ),
                        //   ),
                        // )
                      ])),
            ])),
      ),
      // floatingActionButtonLocation:
      // FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Container(
      //   height: 50,
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(primary: Color(greenColor)),
      //         child: Text(
      //           '작성하기',
      //           style: TextStyle(
      //               fontWeight: FontWeight.w600,
      //               color: Colors.white,
      //               fontSize: 16.0),
      //         ),
      //         onPressed: () {},
      //   ),
      // ),

      // bottomSheet: Container(
      //   width: MediaQuery.of(context).size.width,
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(primary: Color(greenColor)),
      //     child: Text(
      //       '작성하기',
      //       style: TextStyle(
      //           fontWeight: FontWeight.w600,
      //           color: Colors.white,
      //           fontSize: 16.0),
      //     ),
      //     onPressed: () {},
      //   ),
      // ),
    );
  }
}
