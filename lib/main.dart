import 'package:flutter/material.dart';
import 'package:d/indexPage.dart';
import 'package:d/secondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '是新闻啦',
      theme: ThemeData(),
      home: MyHomePage(title: '是新闻啦'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _userName = TextEditingController();
  final _userPws = TextEditingController();
  final _keyFrom = GlobalKey<FormState>();

  //region 登录功能，密码正确则跳转
  bool _login() {
    if (_userName.text == "11111111111" && _userPws.text == "123456") {
      return true;
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("提示"),
              content: Text("账号或密码错误，请检查"),
              actions: <Widget>[
                FlatButton(
                  child: Text("确认"),
                  onPressed: () {
                    Navigator.of(context).pop(true); //关闭对话框
                  },
                )
              ],
            );
          });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _keyFrom,
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                autovalidate: true,
                controller: _userName,
                decoration: InputDecoration(
                  labelText: "账号",
                  hintText: "输入账号或者密码",
                  icon: Icon(Icons.person),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : "请输入用户名";
                },
              ),
              TextFormField(
                controller: _userPws,
                decoration: InputDecoration(
                    labelText: "密码", hintText: "请输入密码", icon: Icon(Icons.lock)),
                validator: (v) {
                  return v.trim().length > 5 ? null : "密码不能低于5位";
                },
                obscureText: true, //标记这个输入框是密码框
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if ((_keyFrom.currentState as FormState).validate()) {
                      if (_login() == true) {
                        Navigator.of(context).pushAndRemoveUntil(
                            new MaterialPageRoute(
                                builder: (context) => new IndexPage()),
                                (route) => route == null);
                      }
                    }
                  },
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if ((_keyFrom.currentState as FormState).validate()) {
                      if (_login() == true) {
                        Navigator.of(context).pushAndRemoveUntil(
                            new MaterialPageRoute(
                                builder: (context) => new IndexPage()),
                                (route) => route == null);
                      }
                    }
                  },
                  child: Text(
                    "注册",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
//endregion
}