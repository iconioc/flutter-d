import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  List<Widget> _getData(){
    List<Widget> list=new List();
    for(var i=1;i<20;i++){
      list.add(ListTile(
        title: Text("热搜 $i"),
        subtitle: Text('新闻描述balabalabala$i'),
        trailing: Icon(Icons.keyboard_arrow_right),
        isThreeLine: false,
        dense: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        onTap: (){
          print('tap');
        },
        onLongPress: () {
          print('longPress');
        },
        selected: i.isEven ? true : false,
        leading: CircleAvatar(
            backgroundImage: NetworkImage('http://pic31.nipic.com/20130710/12018626_110428606000_2.jpg')
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: this._getData(),//通过私有方法调用
    );
  }
}


