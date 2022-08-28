import 'package:T4/Login/login.dart';
import 'package:T4/Mypage/mypageMain.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../Login/refreshToken.dart';
import '../server.dart';

class MyPageEdit extends StatefulWidget {
  final String name;
  final String imageURL;
  final String mbti;
  final String introduction;

  const MyPageEdit({Key? key, required this.name, required this.mbti, required this.imageURL, required this.introduction}) : super(key: key);

  @override
  State<MyPageEdit> createState() => _MyPageEditState();
}

class _MyPageEditState extends State<MyPageEdit> {

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  String _selectRegion = '용산구';

  String imgUrl = "";
  String userName = "";
  String introduce = "";
  String mbti = "";

  int age = 0;
  String sex = "";

  String place = "";
  String time = "";

  int score = 0;

  void getImage({required ImageSource source}) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  void editUserInfo() async {
    var url = Uri.http('${serverHttp}:8080', '/member/info/profile');

    final data = jsonEncode(
        {
          'name': widget.name,
          'mbti': controller1.text,
          'introduction': controller2.text,
        }
    );

    var response = await http.post(url, body: data, headers: {
      'Accept': 'application/json',
      "content-type": "application/json",
      "X-AUTH-TOKEN": "${authToken}"
    });

    print(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      var data = body["response"];
      print("data: ${data}", );
      userInfo();
      //Navigator.pop(context);


      //Navigator.pop(context);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => MyPage(imgURL: imgUrl, userName: userName, introduce: introduce, mbti: mbti, age: age, sex: sex, score: score,)),
      // );

      // name = data["name"].toString();
    } else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        editUserInfo();
        check = false;
      }
    }
    else {
      print('error : ${response.reasonPhrase}');
    }
  }

  Future<dynamic> patchUserProfileImage(dynamic input) async {
    print("프로필 사진을 서버에 업로드 합니다.");
    var dio = new Dio();

    try {

      // dio.options.maxRedirects.isFinite;
      dio.options.baseUrl = 'http://${serverHttp}:8080';
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers = {'X-AUTH-TOKEN': authToken};

      final response = await dio.post('/member/info/profile-image', data: input);

      return response.data;
    } catch (e) {
      print("error: ${e}");
    }
  }

  void userInfo() async {
    RecentPromiseInfo();
    var url = Uri.http('${serverHttp}:8080', '/member/info');

    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      "content-type": "application/json",
      "X-AUTH-TOKEN": "${authToken}"
    });

    print(url);
    print("Bearer ${authToken}");
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      var data = body["response"];
      print("data: ${data}", );
      imgUrl = data["imgUrl"].toString();
      userName = data["name"].toString();

      var profileDto = data["profileDto"];
      print(profileDto);
      age = int.parse(profileDto["birthYear"]);
      age = 2023 - age;

      sex = profileDto["sex"].toString();

      if(sex == "FEMALE"){
        sex = "여성";
      }else{
        sex = "남성";
      }

      if(profileDto["mbti"] == null){
        mbti = "";
      }
      else{
        mbti = profileDto["mbti"].toString();
      }

      if(profileDto["introduction"] == null){
        introduce = "";
      }
      else{
        introduce = profileDto["introduction"].toString();
      }

      score = profileDto["score"];

      print (imgUrl);

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            '내 정보 변경',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('정보 변경에 성공하였습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyPage(imgURL: imgUrl, userName: userName, introduce: introduce, mbti: mbti, age: age, sex: sex, score: score, place: place, time: time)),
      );

      // name = data["name"].toString();
    } else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        userInfo();
        check = false;
      }
    }
    else {

      print('error : ${response.reasonPhrase}');
    }
  }

  void RecentPromiseInfo() async {
    var url = Uri.http('${serverHttp}:8080', '/member/plan/scheduled');

    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      "content-type": "application/json",
      "X-AUTH-TOKEN": "${authToken}"
    });

    print(url);
    print("${authToken}");
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));

      var data = body["response"];

      data = data["list"];

      if(data.length != 0){
        for(dynamic i in data){
          place = i["restaurant"];
          time = i["appointmentTime"];
          time = time.substring(11, 16);
          break;
        }
      }
      else{
        place = "";
        time = "";
      }

      print("장소는 ${place}");


//      print("시간은: ${time.substring(11,16)}");


      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => MyPage(imgURL: imgUrl, userName: userName, introduce: introduce, mbti: mbti, age: age, sex: sex, score: score,)),
      // );

      // name = data["name"].toString();
    } else if(response.statusCode == 401){
      await RefreshToken(context);
      if(check == true){
        userInfo();
        check = false;
      }
    }
    else {

      print('error : ${response.reasonPhrase}');
    }
  }

  @override
  void initState() {
    super.initState();
    controller1..text = '${widget.mbti}';
    controller2..text = '${widget.introduction}';
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
              onPressed: () async {

                final _imageFile = this._imageFile;

                if(_imageFile != null){
                  dynamic sendData = _imageFile.path;
                  var formData = FormData.fromMap({'file': await MultipartFile.fromFile(sendData)});
                  patchUserProfileImage(formData);
                }

                editUserInfo();

                //Navigator.pop(context);
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => MyPage()),
                // );
                // TODO dialog show

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
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                                Spacer(),
                              ],
                            )
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 5 /7,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    getImage(source: ImageSource.gallery);
                                  },
                                  child: Container(
                                      child: CircleAvatar(
                                          radius: 100.0,
                                          backgroundImage: _imageFile == null ? NetworkImage("${widget.imageURL}")  : FileImage(File(_imageFile!.path)) as ImageProvider
                                        //FileImage(File(_imageFile!.path))
                                      )
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.only(top: 30.0),
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
                                              controller: controller1,
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
                                                  hintStyle: TextStyle(fontSize: 16.0)
                                                ),
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
                                              controller: controller2,
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
                                                  hintStyle: TextStyle(fontSize: 16.0)
                                              ),
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
                      ],
                    )
                ),

              ],
            ),
          )
      ),
    );
  }
}
