
import 'package:flutter/material.dart';
import 'package:flutterapp/dao/travel_dao.dart';
import 'package:flutterapp/model/travel_tab_model.dart';
import 'package:flutterapp/pages/travel_tab_page.dart';
import 'package:flutterapp/utils/statusbar_util.dart';
import 'package:underline_indicator/underline_indicator.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  TabController _tabController;

  List<TravelTabModelTab> tabs = [];

  TravelTabModel travelTabModel;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 0);
    _loadData();
    super.initState();
  }

  void _loadData() {
     TravelDao.fetchTravelTab().then((TravelTabModel model){
      _tabController = TabController(vsync: this, length: model.tabs.length);
      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    }).catchError((e){
      print(e);
    });
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: StatusBarUtil.getStatusBarHeight(context)),
            color: Colors.white,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
              indicator: UnderlineIndicator(
                  strokeCap: StrokeCap.round,
                  borderSide: BorderSide(
                    color: Color(0xff2fcfbb),
                    width: 3,
                  ),
                  insets: EdgeInsets.only(bottom: 10)),
              tabs: tabs.map<Tab>((TravelTabModelTab tab){
                return Tab(text: tab.labelName);
              }).toList(),
            ),
          ),
         Flexible(
           child:  TabBarView(
             controller: _tabController,
             children: tabs.map((TravelTabModelTab tab){
               return TravelTabPage(travelUrl: travelTabModel.url,groupChannelCode: tab.groupChannelCode, params: travelTabModel.params.toJson());
             }).toList(),
           ),
         )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
