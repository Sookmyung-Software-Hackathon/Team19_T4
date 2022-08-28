import 'package:T4/color.dart';
import 'package:T4/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateReviewPage extends StatefulWidget {
  const CreateReviewPage({Key? key}) : super(key: key);

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  late String _good;
  late double _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Color(0xffffffff),
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
                Container(
                    padding: EdgeInsets.only(
                        right: 30.0, left: 30.0, top: 5.0, bottom: 5.0),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 40.0),
                            child: Column(children: [
                              Text(
                                "식사는 맛있게 하셨나요?",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Text(
                                "밥 친구와의 식사가 어땠는지 알려주세요!",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333),
                                ),
                              ),
                            ])),
                        Container(
                          child:
                        Text(
                          "만족하셨나요?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333),
                          ),
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar(
                                initialRating: 3,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Image.asset('images/rice_fill.png'),
                                  half: Image.asset('images/rice_fill.png'),
                                  empty: Image.asset('images/rice.png'),
                                ),
                                itemPadding:
                                EdgeInsets.symmetric(horizontal: 5.0),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  _rating=rating;
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            "어떤 점이 좋았나요? [선택]",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffF0F0F0),
                          ),
                          // width: MediaQuery.of(context).size.width *
                          //     50 /
                          //     100,
                          height: MediaQuery.of(context).size.height * 10 / 100,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? null : null,
                            onSaved: (value) => _good = value!,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xfffffff),
                              )),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xfffffff),
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 14.0, color: Color(0xff333333)),
                          ),
                        ),
                      ],
                    ))
                ]))),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(greenColor),
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
          child: Text(
            '맛있는 후기 보내기',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16.0),
          ),
          onPressed: () {
            _postReview(_good, "test1234", _rating.toInt());
          },
        ),
      ),
    );
  }

  _postReview(String comment, id, int score) async {
    var url = Uri.http('${serverHttp}:8080', '/member/signup');

    final data = jsonEncode({'score': score, 'comment': comment, 'targetId': id});

    var response = await http.post(url, body: data, headers: {
      'Accept': 'application/json',
      "content-type": "application/json"
    });

    // print(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(response.body);
      dynamic data=body['response'];

      if (body["success"] == true) {
        _showDialog("작성 완료", data['message']);
      }
      // else {
      //   _showDialog("작성 실패", data['message']);
      // }

    } else {
      print('error : ${response.reasonPhrase}');
    }
  }

  void _showDialog(String title, text) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
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
