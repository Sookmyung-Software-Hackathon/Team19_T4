import 'package:T4/Mypage/mypageMain.dart';
import 'package:T4/color.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<String> _title = [
    '마라탕 먹으러',
    '가실 분',
    '구합니다.',
    '마라탕 먹으러',
    '가실 분',
    '구합니다.',
    '마라탕 먹으러',
    '가실 분',
    '구합니다.'
  ];
  List<String> _location = [
    '탕화쿵푸',
    '라화방',
    '리또리또',
    '서브웨이',
    '탕화쿵푸',
    '라화방',
    '리또리또',
    '서브웨이',
    '탕화쿵푸',
    '라화방'
  ];
  List<String> _time = [
    '2022.08.28 13:00',
    '2022.08.28 12:00',
    '2022.08.28 13:00',
    '2022.08.30 13:00',
    '2022.08.29 13:30',
    '2022.08.28 13:00',
    '2022.08.28 13:10',
    '2022.08.28 13:40',
    '2022.08.28 13:00',
    '2022.08.28 13:00',
  ];
  List<String> _total = ['1', '2', '3', '2', '8', '2', '9', '2', '2', '1'];
  List<String> _current = [
    '1',
    '1',
    '1',
    '2',
    '4',
    '2',
    '6',
    '2',
    '2',
    '1',
  ];

  // late var dataMap=widget.data;
  // var readBoardData;
  // var readBoardUserData;

  final _regionList = [
    '종로구',
    '중구',
    '용산구',
    '성동구',
    '광진구',
    '동대문구',
    '중랑구',
    '성북구',
    '강북구',
    '도봉구',
    '노원구',
    '은평구',
    '서대문구',
    '마포구',
    '양천구',
    '강서구',
    '구로구',
    '금천구',
    '영등포구',
    '동작구',
    '관악구',
    '서초구',
    '강남구',
    '송파구',
    '강동구'
  ];
  String _selectRegion = '용산구';

  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xffffffff),
            child: SafeArea(
                child: Container(
                    child: Column(children: [
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: MediaQuery.of(context).size.height * 7 / 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.location_on_rounded,
                            color: Color(greenColor),
                            size: 32.0,
                          ),
                        ),
                        // Padding(padding: EdgeInsets.all(2.0)),
                        Container(
                          // width: MediaQuery.of(context).size.width*25/100,
                          // height: MediaQuery.of(context).size.height *
                          //     7 /
                          //     100,
                          child: DropdownButton(
                            // isExpanded: true,
                            value: _selectRegion,
                            onChanged: (newValue) {
                              setState(() {
                                _selectRegion = newValue as String;
                              });
                            },
                            // underline: Container(
                            //   height: 2,
                            //   color: Color(greenColor),
                            // ),
                            underline:
                                DropdownButtonHideUnderline(child: Container()),
                            items: _regionList.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xff333333),
                                        fontWeight: FontWeight.w600)),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 35.0,
                          ),
                        )),
                        Container(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyPage(),
                                ));
                          },
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Color(greenColor),
                            size: 35.0,
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 5.0, bottom: 30.0),
                          child: Column(children: [
                            SmartRefresher(
                              // enablePullDown: true,
                              enablePullUp: true,
                              header: WaterDropHeader(),
                              footer: CustomFooter(
                                builder:
                                    (BuildContext context, LoadStatus? mode) {
                                  Widget body;
                                  if (mode == LoadStatus.idle) {
                                    body = Text("pull up load");
                                  } else if (mode == LoadStatus.loading) {
                                    body = Text("pull up load");
                                  } else if (mode == LoadStatus.failed) {
                                    body = Text("Load Failed!Click retry!");
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = Text("release to load more");
                                  } else {
                                    body = Text("No more Data");
                                  }
                                  return Container(
                                    height: 55.0,
                                    child: Center(child: body),
                                  );
                                },
                              ),
                              controller: _refreshController,
                              onRefresh: _onRefresh,
                              onLoading: _onLoading,
                              child: ListView.builder(
                                itemBuilder: (c, i) =>
                                    Card(child: Center(child: Text(items[i]))),
                                itemExtent: 100.0,
                                itemCount: items.length,
                              ),
                            ),
                          ]))))
            ])))));
  }
}
