import 'package:T4/mainBoard/mainBoardPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Login/findPassword.dart';
import 'signup.dart';
import 'package:T4/server.dart';
import 'package:T4/color.dart';
import 'package:T4/mainBoard/createBoard.dart';

var authToken = '';
var refreshToken = '';
var name = "";
var id = "";
var res;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  late String _id;
  late String _password;

  void validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid Email: $_id, password: $_password');

      _signIn(_id, _password);
    } else {
      print('Form is invalid Email: $_id, password: $_password');
    }
  }

  void signUp() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final authToken = Provider.of<AccessToken>(context);

    return GestureDetector(
        onTap: () {
          //FocusManager.instance.primaryFocus?.unfocus();
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: new Container(
              child: Container(
                padding: EdgeInsets.all(30),
                child: new Form(
                  key: _formKey,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 0.0, top: 0.0, right: 0.0, bottom: 20.0),
                        alignment: Alignment.center,
                        child: new Text(
                          "?????????",
                          style: new TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Color(greenColor)),
                        ),
                      ),

                      Container(
                        child: new Column(
                          children: <Widget>[
                            new TextFormField(
                              decoration: new InputDecoration(labelText: '?????????'),
                              validator: (value) =>
                              value!.isEmpty ? '???????????? ??????????????????' : null,
                              onSaved: (value) => _id = value!,
                            ),
                            Padding(padding: EdgeInsets.all(5.0)),
                            new TextFormField(
                              obscureText: true,
                              decoration:
                              new InputDecoration(labelText: '????????????'),
                              validator: (value) => value!.isEmpty
                                  ? '??????????????? ??????????????????'
                                  : null,
                              onSaved: (value) => _password = value!,
                            ),
                          ],
                        ),
                      ),

                      //?????????
                      Container(
                        margin: EdgeInsets.only(left: 0.0, top: 40.0, right: 0.0, bottom: 10.0),
                        child: new ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            primary: Color(greenColor),
                          ),
                          child: new Text(
                            '?????????',
                            style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          onPressed: validateAndSave,
                        ),
                        height: 45
                      ),
                      //????????????
                      Container(
                        margin: EdgeInsets.only(
                            left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
                        child:new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5.0),
                                child: TextButton(
                                    onPressed: signUp,
                                    child: const Text(
                                      "????????????",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xff666666),
                                      ),
                                    ),
                                  )
                                ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

   _signIn(String id, pass) async {
    var url = Uri.http('${serverHttp}:8080', '/member/login');

    final data = jsonEncode({'memberId': id, 'password': pass});

    var response = await http.post(url, body: data, headers: {
      'Accept': 'application/json',
      "content-type": "application/json"
    });

    // print(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(response.body);
      dynamic data=body["response"];

      if (body["success"] == true) {
        String token = data["accessToken"];
        refreshToken = data["refreshToken"];
        print("???????????? ?????????????????????.");
        authToken = token;
        print("authToken: ${authToken}");


        await _boardList("?????????");

        print(res);
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainBoardPage(data: res,)),
        );
      }
    } else if(response.statusCode == 400){
      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(response.body);
      dynamic data=body["error"];

      if (body["success"] == false && data["errorName"]=="USER_NOT_FOUND") {
        _showDialog("????????? ????????? ???????????? ????????????.");
      }
      else if (body["success"] == false && data["errorName"]=="WRONG_PASSWORD"){
      _showDialog("??????????????? ???????????????.");
      }
      // else{
      // _showDialog("????????? password??? ????????? ??? ????????????.");
      // }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  _boardList(String loc) async{
    Uri.encodeComponent(loc);
    Map<String, dynamic> _queryParameters = <String, dynamic>{
      'location': {'gu': loc}
    };
    Uri.encodeComponent(loc);

    String jsonString=jsonEncode(_queryParameters);

    print(jsonEncode(_queryParameters));

    // jsonDecode(jsonString);
    var url = Uri.http('${serverHttp}:8080', '/post/location');

    var response = await http.post(url, body: jsonString,headers: {
      'Accept': 'application/json',
      "content-type": "application/json",
      "X-AUTH-TOKEN": "${authToken}"
    });

    // print(url);
    print("boardList: ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

      var body = jsonDecode(utf8.decode(response.bodyBytes));
      dynamic data=body["response"]['list'];

      res=data;
    }
    else {
      print(response.reasonPhrase);
    }
  }

  void _showDialog(String text){
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          '????????? ??????',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('??????'),
          ),
        ],
      ),
    );
  }
}