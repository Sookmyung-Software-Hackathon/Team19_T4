import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyPageEdit extends StatefulWidget {
  const MyPageEdit({Key? key}) : super(key: key);

  @override
  State<MyPageEdit> createState() => _MyPageEditState();
}

class _MyPageEditState extends State<MyPageEdit> {

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void getImage({required ImageSource source}) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: SafeArea(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                primary: Color(0xffFF5D5D),
                onSurface: Color(0xffFF5D5D),
              ),
              onPressed: () {
                print("저장");
              },
              child: Text('수정 완료'),
            ),
          ),
          ),
          body: SingleChildScrollView(
            child: Column(

              children: <Widget>[
                Container(
                  //margin: EdgeInsets.only(bottom: 300.0),
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
                      padding: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 150,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            GestureDetector(
                              onTap: () {
                                getImage(source: ImageSource.gallery);
                              },
                              child: Container(
                                  child: CircleAvatar(
                                      radius: 100.0,
                                      backgroundImage: _imageFile == null ? NetworkImage("https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg")  : FileImage(File(_imageFile!.path)) as ImageProvider
                                    //FileImage(File(_imageFile!.path))
                                  )
                              ),
                            ),
                            //
                            // GestureDetector(
                            //   onTap: (){
                            //     getImage(source: ImageSource.gallery);
                            //   },
                            //   child: Container(
                            //     height: 160.0,
                            //     width: 160.0,
                            //     decoration: new BoxDecoration(
                            //       color: const Color(0xff7c94b6),
                            //       image: new DecorationImage(
                            //         image: ExactAssetImage(_imageFile.path),
                            //         fit: BoxFit.cover,
                            //       ),
                            //       border:
                            //       Border.all(color: Colors.red, width: 5.0),
                            //       borderRadius:
                            //       new BorderRadius.all(const Radius.circular(80.0)),
                            //     ),
                            //   ),
                            // ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(top: 50.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("MBTI",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(10.0)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffFF5D5D), width: 2.0),
                                              ),
                                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              hintText: 'MBTI를 입력하세요.',
                                              hintStyle: TextStyle(fontSize: 16.0)),
                                        ),
                                        height: 40,
                                      ),


                                      Text("한 줄 소개",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          minLines: 2,
                                          maxLines: 2,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(10.0)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffFF5D5D), width: 2.0),
                                              ),
                                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              hintText: '한 줄 소개를 입력하세요.',
                                              hintStyle: TextStyle(fontSize: 16.0)),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),


                              ],
                            ),

                          ],
                        ),
                      ),
                    )
                ),

              ],
            ),
          )
      ),
    );
  }
}
