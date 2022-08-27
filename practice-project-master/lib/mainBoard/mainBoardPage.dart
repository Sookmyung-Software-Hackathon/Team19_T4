import 'package:T4/Mypage/mypageMain.dart';
import 'package:T4/mainBoard/createBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:T4/color.dart';

class MainBoardPage extends StatefulWidget {
  const MainBoardPage({Key? key}) : super(key: key);

  @override
  State<MainBoardPage> createState() => _MainBoardPageState();
}

class _MainBoardPageState extends State<MainBoardPage> {
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
                        children: [
                          Container(
                            width: 25.0,
                            height: 25.0,
                            child: Image.asset('images/location.png'),
                          ),
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text(
                            '서울특별시, 용산구',
                            style: TextStyle(
                                color: Color(0xff333333), fontSize: 16.0),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'icons/bell.svg',
                            ),
                            iconSize: 15,
                          )),
                          Container(
                              child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => MyPage()));
                            },
                            icon: SvgPicture.asset(
                              'icons/mypage.svg',
                            ),
                            iconSize: 15,
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
                                height: MediaQuery.of(context).size.height *
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
                                    margin:
                                        EdgeInsets.only(left: 5.0, right: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('마라탕 먹으러 가실 분 구합니다.',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Color(0xff333333),
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Padding(
                                                padding: EdgeInsets.all(2.0)),
                                            Text('탕화쿵푸 숙대점',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Color(0xff333333))),
                                            Padding(
                                                padding: EdgeInsets.all(2.0)),
                                            Text(
                                              '2022.08.28 오후 1시',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Color(0xff666666)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "1/2",
                                                style: TextStyle(
                                                    fontSize: 22.0,
                                                    color: Color(0xff333333)),
                                              ),
                                            ])
                                      ],
                                    ))),
                          ),
                        ],
                      )),
                )),
              ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => CreateBoardPage()));
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
