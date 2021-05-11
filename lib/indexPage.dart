import 'package:flutter/material.dart';
import 'package:d/firstPage.dart';
import 'package:d/secondPage.dart';
import 'package:d/thirdPage.dart';


class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexPageState();

}
class IndexPageState extends State<IndexPage> {
  int _tabIndex=0;
  List<BottomNavigationBarItem> _navigationView;
  var appBarTitles=['是首页啦','发现','是个人信息啦'];
  PageController pageController;
  var _body;
//  初始化几个底部item
  initData(){
    _body=new IndexedStack(
      children: <Widget>[
        new FirstPage(),new SecondPage(),new ThirdPage()
      ],
      index: _tabIndex,
    );
  }
  @override
  void initState(){
    super.initState();
    _navigationView=<BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: new Text(appBarTitles[0]),
        backgroundColor: Colors.blue
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title:new Text(appBarTitles[1]),
        backgroundColor: Colors.blue
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: new Text(appBarTitles[2])
      ),
    ];
  }
  final navigatorKey=GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      navigatorKey: navigatorKey,
      theme: new ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            appBarTitles[_tabIndex],
            style: new TextStyle(color: Colors.pink),
          ),
        ),
        body: _body,
        bottomNavigationBar: new BottomNavigationBar(
          items: _navigationView
          .map((BottomNavigationBarItem navigationView)=>navigationView)
          .toList(),
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }

}
