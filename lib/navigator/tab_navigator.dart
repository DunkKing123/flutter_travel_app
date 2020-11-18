
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/pages/my_page.dart';
import 'package:flutterapp/pages/search_page.dart';
import 'package:flutterapp/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>{

//  final PageController _pageController = PageController();
  PageController _pageController;
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
     void initState() {
       super.initState();
       _pageController = PageController();
     }

     @override
     void dispose() {
      _pageController.dispose();
       super.dispose();
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          SearchPage(hideLeft: true),
          TravelPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home,color: _defaultColor),
            activeIcon: Icon(Icons.home,color: _activeColor),
          title: Text("首页",style: TextStyle(color: _currentIndex != 0 ? _defaultColor : _activeColor))
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,color: _defaultColor),
            activeIcon: Icon(Icons.search,color: _activeColor),
            title: Text("搜索",style: TextStyle(color: _currentIndex != 1 ? _defaultColor : _activeColor))
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt,color: _defaultColor),
            activeIcon: Icon(Icons.camera_alt,color: _activeColor),
            title: Text("旅拍",style: TextStyle(color: _currentIndex != 2 ? _defaultColor : _activeColor))
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: _defaultColor),
            activeIcon: Icon(Icons.account_circle,color: _activeColor),
            title: Text("我的",style: TextStyle(color: _currentIndex != 3 ? _defaultColor : _activeColor))
        )
      ],),
    );
  }

}
