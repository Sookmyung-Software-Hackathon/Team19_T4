import 'dart:convert';
import 'package:T4/Login/login.dart';
import 'package:T4/mainBoard/mainBoardPage.dart';
import 'package:http/http.dart' as http;
import 'package:T4/server.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'package:T4/color.dart';

class CreateBoardPage extends StatefulWidget {
  const CreateBoardPage({Key? key}) : super(key: key);

  @override
  State<CreateBoardPage> createState() => _CreateBoardPageState();
}

class _CreateBoardPageState extends State<CreateBoardPage> {
  late String _title;
  late String _store;
  late int _people;
  late String _content;
  DateTime _time=DateTime.now();
  late String _formatDate;

  final _regionList=['종로구','중구','용산구','성동구','광진구','동대문구','중랑구','성북구','강북구','도봉구','노원구','은평구','서대문구','마포구','양천구','강서구','구로구','금천구','영등포구','동작구','관악구','서초구','강남구','송파구','강동구'];
  String _selectRegion='용산구';
  final _foodList=['한식', '양식', '중식', '일식','기타'];
  String _selectFood='한식';

  // DateTime? _selectedDate = DateTime.now();
  final format = DateFormat("yyyy/MM/dd HH:MM");
  final _formKey = new GlobalKey<FormState>();

  void validateAndCreateBoard() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid: title: $_title, store: $_store, people: $_people, content: $_content');

      _postCreateBoard(_title, _content, _formatDate, _selectRegion, _store, _selectFood, _people);
    } else {
      print('Form is invalid: title: $_title, store: $_store, people: $_people, content: $_content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Color(0xffffffff),
            child: new Form(
            key: _formKey,
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
                    Expanded(
                      child: SingleChildScrollView(
                          child:Container(
                            padding: EdgeInsets.only(left:25.0, right:25.0, top:5.0),
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
                            validator: (value) =>
                            value!.isEmpty ? '제목을 입력해주세요' : null,
                            onSaved: (value) => _title = value!,
                            decoration: InputDecoration(
                                hintText: '제목',
                                contentPadding: EdgeInsets.only(left: 10.0),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff666666),
                                  )),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff666666),
                                  ),
                                ),),
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Color(0xff333333)),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom:10.0)),
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            // color: Color(0xffF0F0F0),
                            border: Border(
                                bottom: BorderSide(
                              color: Color(0xff666666),
                              width: 1.0,
                            ),)
                          //     top: BorderSide(
                          //       color: Color(0xff666666),
                          //   width: 2.0,
                          // )
                          //   ),
                          //   border: Border.all(
                          //     width: 3,
                          //     color: Color(greenColor)
                          //   )
                          ),
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, bottom: 25.0, top:5.0),
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
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Container(
                                    width: MediaQuery.of(context).size.width*25/100,
                                    height: MediaQuery.of(context).size.height *
                                        7 /
                                        100,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: _selectRegion,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectRegion = newValue as String;
                                        });
                                      },
                                      underline: Container(
                                        height: 1,
                                        color: Color(greenColor),
                                      ),
                                      // underline: DropdownButtonHideUnderline(
                                      //     child: Container()),
                                      items: _regionList.map((value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value, style: TextStyle(fontSize: 14.0, color: Color(0xff333333))),
                                        );
                                      }).toList(),
                                    ),
                                  ),
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
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          50 /
                                          100,
                                      height: MediaQuery.of(context).size.height *
                                          6 /
                                          100,
                                      child: TextFormField(
                                        validator: (value) =>
                                        value!.isEmpty ? '음식점 이름을 입력해주세요.' : null,
                                        onSaved: (value) => _store = value!,
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(greenColor),
                                                )),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(greenColor),
                                              ),
                                            ),
                                          hintText: "먹고 싶은 가게 이름",
                                            hintStyle: TextStyle(fontSize: 14.0)
                                        ),
                                          style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
                                      ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(5.0)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*25/100,
                                    child: Text(
                                      '음식 종류',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                          color: Color(0xff333333),
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Container(
                                    width: MediaQuery.of(context).size.width*25/100,
                                    height: MediaQuery.of(context).size.height *
                                        7 /
                                        100,
                                      child: DropdownButton(
                                        isExpanded: true,
                                        value: _selectFood,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectFood = newValue as String;
                                          });
                                        },
                                        underline: Container(
                                          height: 1,
                                          color: Color(greenColor),
                                        ),
                                        // underline: DropdownButtonHideUnderline(
                                        //     child: Container()),
                                        items: _foodList.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value, style: TextStyle(fontSize: 14.0, color: Color(0xff333333))),
                                          );
                                        }).toList(),
                                      ),),
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
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                    50 /
                                    100,
                                    height: MediaQuery.of(context).size.height *
                                        6 /
                                        100,
                                    child: DateTimeField(
                                      onSaved: (value) => _time = value!,
                                      format: format,
                                      initialValue: DateTime.now(),
                                      onShowPicker: (context, currentValue) async {
                                        final date = await showDatePicker(
                                            context: context,
                                            firstDate: DateTime.now(),
                                            initialDate: currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                        if (date != null) {
                                          final time = await showTimePicker(
                                            context: context,
                                            initialTime:
                                            TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                          );
                                          return DateTimeField.combine(date, time);
                                        } else {
                                          return currentValue;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(greenColor),
                                              )),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(greenColor),
                                            ),)
                                      ),
                                      style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
                                    ),
                                  ),
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
                                      '참여 인원',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xff333333),
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          50 /
                                          100,
                                    height: MediaQuery.of(context).size.height *
                                        7 /
                                        100,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) =>
                                        value!.isEmpty ? '모집 인원을 입력해주세요.': int.parse(value) > 10? '10명 이하로 입력해주세요.': null,
                                        onSaved: (value) => _people = int.parse(value!),
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(greenColor),
                                                )),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(greenColor),
                                              ),
                                            ),
                                        hintText: "최대 10명",
                                        hintStyle: TextStyle(fontSize: 14.0)),
                                        style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
                                      ),),
                                ],
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Container(
                              //       width: MediaQuery.of(context).size.width *
                              //           25 /
                              //           100,
                              //       child: Text(
                              //         '오픈 채팅방 링크',
                              //         style: TextStyle(
                              //           fontSize: 14.0,
                              //             color: Color(0xff333333),
                              //             fontWeight: FontWeight.w600
                              //         ),
                              //       ),
                              //     ),
                              //     Padding(padding: EdgeInsets.all(5.0)),
                              //     Container(
                              //         width: MediaQuery.of(context).size.width *
                              //             50 /
                              //             100,
                              //       height: MediaQuery.of(context).size.height *
                              //           6 /
                              //           100,
                              //         child: TextFormField(
                              //           validator: (value) =>
                              //           value!.isEmpty ? null: null,
                              //           onSaved: (value) => _kakoLink = value!,
                              //           decoration: InputDecoration(
                              //               enabledBorder: UnderlineInputBorder(
                              //                   borderSide: BorderSide(
                              //                     color: Color(greenColor),
                              //                   )),
                              //               focusedBorder: UnderlineInputBorder(
                              //                 borderSide: BorderSide(
                              //                   color: Color(greenColor),
                              //                 ),
                              //               ),
                              //           hintText: "선택",
                              //           hintStyle: TextStyle(fontSize: 14.0)),
                              //           style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
                              //         ),),
                              //   ],
                              // ),
                              // Padding(padding: EdgeInsets.only(bottom:15.0)),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //   Text("* 링크를 작성하실 경우 매징된 유저에게 링크가 보내집니다.", style: TextStyle(fontSize: 10.0, color: Color(0xff333333)),)
                              //
                              // ],)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 85 / 100,
                              height: 150.0,
                              child: TextFormField(
                                validator: (value) =>
                                value!.isEmpty ? "간단하게라도 설명을 적어주세요" : null,
                                onSaved: (value) => _content = value!,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xffffffff),
                                        )),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                    hintText: "간단한 설명을 적어주세요",
                                    hintStyle: TextStyle(fontSize: 14.0)
                                ),
                                style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
                              ),
                            ),
                        // Container(
                        //     // decoration: BoxDecoration(
                        //     //     borderRadius: BorderRadius.circular(10),
                        //     //     // color: Color(0xfff0f0f0),
                        //     //     border: Border.all(
                        //     //         width: 2, color: Color(greenColor))),
                        //     width: MediaQuery.of(context).size.width * 85 / 100,
                        //     height: 150.0,
                        //     child: TextFormField(
                        //       controller: _content,
                        //       decoration: InputDecoration(
                        //           // contentPadding: EdgeInsets.only(left: 10.0),
                        //           enabledBorder: UnderlineInputBorder(
                        //               borderSide: BorderSide(
                        //                 color: Color(0xffffffff),
                        //               )),
                        //           focusedBorder: UnderlineInputBorder(
                        //             borderSide: BorderSide(
                        //               color: Color(0xffffffff),
                        //             ),
                        //           ),
                        //       hintText: "간단한 설명을 적어주세요!",
                        //       hintStyle: TextStyle(fontSize: 14.0,)),
                        //
                        //     ),
                        // )
                      ])
                      ),)
                    ),
                  ])
            ),
      )),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color(greenColor), padding: EdgeInsets.only(top:15.0, bottom:15.0)),
          child: Text(
            '작성하기',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16.0),
          ),
          onPressed: () {
            _formatDate=DateFormat("yyyy-MM-ddTHH:mm:ss").format(_time);
            validateAndCreateBoard();
            // print(_title+_selectRegion+_store+_selectFood+'사람 수: '+_people.toString());
          },
        ),
      ),
    );
  }

  _postCreateBoard(String title, content, time, location, restaurant, foodType, int parti) async {
    // print(title+' '+location+' '+restaurant+' '+foodType+' '+time+' '+parti.toString());
    Map<String, String> gu = <String, String>{
      "gu": location
    };

    Map plan = {
      'appointmentTime': time,
      'location': gu,
      'restaurant': restaurant,
      'foodType': foodType,
      'numOfParticipants': parti
    };

    var url = Uri.http('${serverHttp}:8080', '/post/new');

    final data = jsonEncode(
        {'title': title, 'content': content, 'chatRoomLink': '', 'plan': plan});

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
      dynamic data = body['response'];

      print(data);
      Navigator.of(context).pop();
    } else {
      print('error : ${response.reasonPhrase}');
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
