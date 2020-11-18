import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/dao/home_dao.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/pages/search_page.dart';
import 'package:flutterapp/pages/speak_page.dart';
import 'package:flutterapp/utils/navigator_util.dart';
import 'package:flutterapp/utils/toast_util.dart';
import 'package:flutterapp/widget/grid_nav.dart';
import 'package:flutterapp/widget/loadingContainer.dart';
import 'package:flutterapp/widget/local_nav.dart';
import 'package:flutterapp/widget/sales_nav.dart';
import 'package:flutterapp/widget/search_bar.dart';
import 'package:flutterapp/widget/sub_nav.dart';
import 'package:flutterapp/widget/webview.dart';
import 'package:fluttertoast/fluttertoast.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {

  static HomeModelConfig config;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  double _appBarAlpha = 0;

//  String _resultString = "";
  List<HomeModelLocalNavList> localNavList = [];
  List<HomeModelBannerList> bannerList = [];
  List<HomeModelSubNavList> subNavList = [];
  HomeModelGridNav gridNav;

  HomeModelSalesBox salesBox;

  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
//    print("HomePage initState");
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loading,
        cover: false,
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: RefreshIndicator(
                onRefresh: _loadData,
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return false;
                  },
                  child: _listView,
                ),
              ),
            ),
            _appBar,
          ],
        ),
      ),
    );
  }

  void _onScroll(double pixels) {
//    print(pixels);

    double alpha = pixels / APPBAR_SCROLL_OFFSET;

    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      _appBarAlpha = alpha;
    });
  }

  Future<Null> _loadData() async {
//    HomeDao.fetch().then((value){
//      setState(() {
//        _resultString = json.encode(value);
//      });
//    }).catchError((e){
//      setState(() {
//        _resultString = json.encode(e.toString());
//      });
//    });

    try {
      HomeModel homeModel = await HomeDao.getHomePageData();
//     debugPrint(homeModel.toJson().toString());
      setState(() {
        localNavList = homeModel.localNavList;
        gridNav = homeModel.gridNav;
        subNavList = homeModel.subNavList;
        salesBox = homeModel.salesBox;
        bannerList = homeModel.bannerList;
        HomePage.config = homeModel.config;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });

    }

    return null;
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        Container(
          height: 160,
          child: Swiper(
            itemCount: bannerList.length,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebView(url: bannerList[index].url)));
                },
                child: Image.network(bannerList[index].icon, fit: BoxFit.fill),
              );
            },
            pagination: SwiperPagination(),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: LocalNav(localNavList: localNavList)),
        Padding(
            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: GridNav(modelGridNav: gridNav)),
        Padding(
            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: SubNav(subNavList: subNavList)),
        Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: SalesBox(
              salesBox: salesBox,
            )),
//        Container(
//          height: 1000,
//          child: ListTile(
//            title: Text(""),
//          ),
//        )
      ],
    );
  }

  Widget get _appBar {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: _appBarAlpha,
          child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              ),
        ),
        Container(
            height: 80,
            child: Padding(
              padding: EdgeInsets.only(top: 24),
              child: SearchBar(
                searchBarType: _appBarAlpha > 0.2 ? SearchBarType.homeLight:SearchBarType.home,
                inputBoxClick: _toSearch,
                speakClick: _jumpToSpeak,
              ),
            ))
      ],
    );
  }

  void _toSearch() {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => SearchPage(searchUrl: HomePage.config.searchUrl)));
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }

}
