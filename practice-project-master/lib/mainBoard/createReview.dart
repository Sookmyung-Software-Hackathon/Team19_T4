import 'package:T4/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CreateReviewPage extends StatefulWidget {
  const CreateReviewPage({Key? key}) : super(key: key);

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  late String _good;

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
                                fontWeight: FontWeight.w600, fontSize: 30),
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
                          "시간 약속을 잘 지켜요",
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
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            "친절해요",
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
                                EdgeInsets.symmetric(horizontal: 4.0),
                                onRatingUpdate: (rating) {
                                  print(rating);
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
                                value!.isEmpty ? '음식점 이름을 입력해주세요.' : null,
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
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
