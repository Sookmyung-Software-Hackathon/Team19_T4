import 'package:flutter/material.dart';

class CreateBoardPage extends StatefulWidget {
  const CreateBoardPage({Key? key}) : super(key: key);

  @override
  State<CreateBoardPage> createState() => _CreateBoardPageState();
}

class _CreateBoardPageState extends State<CreateBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Container(
        color: Color(0xffffffff),
    )));
  }
}
