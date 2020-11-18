
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/widget/webview.dart';

//酒店 旅游 机票
class GridNav extends StatelessWidget {

  final HomeModelGridNav modelGridNav;

  const GridNav({Key key,@required this.modelGridNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        borderRadius: BorderRadius.circular(6),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: _gridNavItems(context),
    );
  }

  _gridNavItems(BuildContext context) {
    if (modelGridNav == null) return null;
    List<Widget> items = [];
    if(modelGridNav.hotel != null ){
      items.add(_gridNavItem(context,modelGridNav.hotel,true));
    }
    if(modelGridNav.travel != null ){
      items.add(_gridNavItem(context,modelGridNav.travel,false));
    }
    if(modelGridNav.flight != null ){
      items.add(_gridNavItem(context,modelGridNav.flight,false));
    }
    return Column(children:items);
  }

  _gridNavItem(BuildContext context,GridNavItem gridNavItem,bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1,gridNavItem.item2,true));
    items.add(_doubleItem(context, gridNavItem.item3,gridNavItem.item4,false));
    List<Widget> expandedItems =[];
    items.forEach((item) {
      expandedItems.add(Expanded(child: item,flex: 1));
    });

    Color startColor = Color(int.parse("0xff"+gridNavItem.startColor));
    Color endColor = Color(int.parse("0xff"+gridNavItem.endColor));

    return Container(
      height: 88,
      margin: first ? null:EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [startColor,endColor])
      ),
      child: Row(children: expandedItems),
    );
  }


  _mainItem(BuildContext context,HomeModelGridNavMainItem item){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (BuildContext context)=>
              WebView(url: item.url,statusBarColor: item.statusBarColor,title: item.title)
        ));
      },
      child: Stack(
        children: <Widget>[
          Image.network(item.icon,fit: BoxFit.contain,height: 88,width: 120,alignment: AlignmentDirectional.bottomEnd),
          Container(
            alignment: AlignmentDirectional.topCenter,
            margin: EdgeInsets.only(top: 12),
            child: Text(item.title,style: TextStyle(fontSize: 14,color: Colors.white),))
        ],
      ),
    );
  }

  _doubleItem(BuildContext context,HomeModelGridNavItem topItem,HomeModelGridNavItem bottomItem,bool isCenterItem){
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context,topItem,true,isCenterItem),
        ),
        Expanded(
          child: _item(context,bottomItem,false,isCenterItem),
        )
      ],
    );
  }

  _item(BuildContext context,HomeModelGridNavItem item,bool first,bool isCenterItem){
    BorderSide borderSide = BorderSide(width: 0.8,color: Colors.white);

    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
            builder: (BuildContext context)=>
                WebView(url: item.url,statusBarColor: item.statusBarColor,title: item.title)
        ));
      },
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
              border:Border(
                  left: borderSide,
                  right: isCenterItem?borderSide :BorderSide.none,
                  bottom: first?borderSide :BorderSide.none)
          ),
          child: Center(child: Text(item.title,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.white),),
          ),
        ),
      ),
    );



  }

}
