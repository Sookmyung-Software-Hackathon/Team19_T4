import 'package:flutter/material.dart';

import 'package:T4/color.dart';

class CreateBoardPage extends StatefulWidget {
  const CreateBoardPage({Key? key}) : super(key: key);

  @override
  State<CreateBoardPage> createState() => _CreateBoardPageState();
}

class _CreateBoardPageState extends State<CreateBoardPage> {
  final TextEditingController _title = new TextEditingController();
  late String _store;
  late int _people;
  late String _kakoLink;
  final _regionList=['종로구','중구','용산구','성동구','광진구','동대문구','중랑구','성북구','강북구','도봉구','노원구','은평구','서대문구','마포구','양천구','강서구','구로구','금천구','영등포구','동작구','관악구','서초구','강남구','송파구','강동구'];
  String _selectRegion='용산구';
  final _foodList=['한식', '양식', '중식', '일식','기타'];
  String _selectFood='한식';

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
                    Expanded(
                      child: SingleChildScrollView(
                          child:Container(
                            padding: EdgeInsets.only(left:30.0, right:30.0, top:5.0),
                          child:
                          Column(children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            // border: Border(
                            //     bottom: BorderSide(
                            //   color: Color(0xffffffff),
                            //   width: 1.0,
                            // )),
                          ),
                          child: TextFormField(
                            controller: _title,
                            decoration: InputDecoration(
                                hintText: '제목',
                                contentPadding: EdgeInsets.only(left: 10.0),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffffffff),
                                  )),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffffffff),
                                  ),
                                )),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom:5.0)),
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            // color: Color(0xffF0F0F0),
                            border: Border(
                                bottom: BorderSide(
                              color: Color(0xff666666),
                              width: 2.0,
                            ),
                              top: BorderSide(
                                color: Color(0xff666666),
                            width: 2.0,
                          )
                            ),
                            // border: Border.all(
                            //   width: 2,
                            //   color: Color(0xff999999)
                            // )
                          ),
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, bottom: 20.0, top:10.0),
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
                                    width: MediaQuery.of(context).size.width*25/100,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: _selectRegion,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectRegion = newValue as String;
                                        });
                                      },
                                      underline: Container(
                                        height: 2,
                                        color: Color(greenColor),
                                      ),
                                      // underline: DropdownButtonHideUnderline(
                                      //     child: Container()),
                                      items: _regionList.map((value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
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
                                      width: MediaQuery.of(context).size.width *
                                          50 /
                                          100,
                                      child: TextFormField(
                                        validator: (value) =>
                                        value!.isEmpty ? '음식점 이름을 입력해주세요.' : null,
                                        onSaved: (value) => _store = value!,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 10.0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(greenColor),
                                                )),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(greenColor),
                                              ),
                                            )),
                                      ),),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom:5.0)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*25/100,
                                    child: Text(
                                      '음식 종류',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Container(
                                    width: MediaQuery.of(context).size.width*25/100,
                                      child: DropdownButton(
                                        isExpanded: true,
                                        value: _selectFood,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectFood = newValue as String;
                                          });
                                        },
                                        underline: Container(
                                          height: 2,
                                          color: Color(greenColor),
                                        ),
                                        // underline: DropdownButtonHideUnderline(
                                        //     child: Container()),
                                        items: _foodList.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),),
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
                                      width: MediaQuery.of(context).size.width *
                                          50 /
                                          100,
                                      child: TextFormField(
                                        controller: _title,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 10.0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xffD9D9D9),
                                                )),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffD9D9D9),
                                              ),
                                            )),
                                      ),),
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
                                      width: MediaQuery.of(context).size.width *
                                          50 /
                                          100,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) =>
                                        value!.isEmpty ? '모집 인원을 입력해주세요.': int.parse(value) > 10? '10명 이하로 입력해주세요.': null,
                                        onSaved: (value) => _people = int.parse(value!),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 10.0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(greenColor),
                                                )),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(greenColor),
                                              ),
                                            )),
                                      ),),
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
                                      width: MediaQuery.of(context).size.width *
                                          50 /
                                          100,
                                      child: TextFormField(
                                        validator: (value) =>
                                        value!.isEmpty ? null: null,
                                        onSaved: (value) => _kakoLink = value!,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 10.0),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(greenColor),
                                                )),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(greenColor),
                                              ),
                                            )),
                                      ),),
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
                                    width: 2, color: Color(greenColor))),
                            width: MediaQuery.of(context).size.width * 80 / 100,
                            height: 150.0,
                            child: TextFormField(
                              controller: _title,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10.0),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffffffff),
                                      )),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffffffff),
                                    ),
                                  )),
                            ),)
                      ])
                      ),)
                    ),
                  ])

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
            ),
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

      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color(greenColor), padding: EdgeInsets.only(top:10.0, bottom:10.0)),
          child: Text(
            '작성하기',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16.0),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
