import 'package:flutter/material.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/widget/webview.dart';

//WIDI电话卡 自由行。。。
class SubNav extends StatelessWidget {
  final List<HomeModelSubNavList> subNavList;

  const SubNav({Key key, @required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((model) {
      items.add(_item(context, model));
    });

    int rowCount = (subNavList.length / 2 +0.5).toInt();

    return Column(

      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.sublist(0,rowCount),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.sublist(rowCount,subNavList.length),
        )
      ],
    );
  }

  _item(BuildContext context, HomeModelSubNavList model) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=> WebView(url: model.url,hideAppBar: model.hideAppBar))
          );
        },
        child: Column(
          children: <Widget>[
            Image.network(model.icon,width: 18,height: 18),
            Padding(
              padding: EdgeInsets.only(top: 3,bottom: 3),
              child: Text(model.title,style: TextStyle(fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }
}
