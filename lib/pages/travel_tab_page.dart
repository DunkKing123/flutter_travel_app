import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapp/dao/travel_dao.dart';
import 'package:flutterapp/model/travel_model.dart';
import 'package:flutterapp/model/travel_tab_model.dart';
import 'package:flutterapp/utils/navigator_util.dart';
import 'package:flutterapp/widget/loadingContainer.dart';
import 'package:flutterapp/widget/webview.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:underline_indicator/underline_indicator.dart';

const TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

const PAGE_SIZE = 10;

class TravelTabPage extends StatefulWidget {
  final String travelUrl;
  final Map params;
  final String groupChannelCode;

  const TravelTabPage(
      {Key key, this.travelUrl, this.groupChannelCode, this.params})
      : super(key: key);

  @override
  _TravelTabPageState createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage>
    with AutomaticKeepAliveClientMixin {
  List<TravelItem> travelItems;
  int _pageIndex = 1;
  bool _loading = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: _loadData,
          child: LoadingContainer(
            cover: false,
            isLoading: _loading,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: StaggeredGridView.countBuilder(
                  controller: _scrollController,
                  crossAxisCount: 2,
                  itemCount: travelItems?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) =>
                      _TravelItem(index: index, item: travelItems[index]),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                )),
          ),
        ));
  }

  Future<Null> _loadData({loadMore = false}) async {
    if (loadMore) {
      _pageIndex++;
    } else {
      _pageIndex = 1;
    }

    try {
      TravelModel model = await TravelDao.fetchTravelData(
          widget.travelUrl ?? TRAVEL_URL,
          widget.params,
          widget.groupChannelCode,
          _pageIndex,
          PAGE_SIZE);

      _loading = false;
      setState(() {
        var items = _filterItems(model.resultList);

        if (travelItems == null) {
          travelItems = items;
        } else {
          travelItems.addAll(items);
        }
      });
    } catch (e) {
      _loading = false;
      print(e);
    }

    return null;
  }

  List<TravelItem> _filterItems(List<TravelItem> resultList) {
    if (resultList == null) {
      return [];
    }

    List<TravelItem> newItems = [];

    for (var item in resultList) {
      if (item.article != null) {
        //移除article为空的模型
        newItems.add(item);
      }
    }
    return newItems;
  }

  @override
  bool get wantKeepAlive => true;
}

class _TravelItem extends StatelessWidget {
  final TravelItem item;
  final int index;

  const _TravelItem({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.article.urls != null && item.article.urls.length > 0) {
          NavigatorUtil.push(
              context,
              WebView(
                url: item.article.urls[0].h5Url,
                title: "旅拍详情",
              ));
        }
      },
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _itemImage(context),
              _itemTitle(),
              _infoText(),
            ],
          ),
        ),
      ),
    );
  }

  _infoText() {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.article.author?.coverImage?.dynamicUrl,
                  width: 24,
                  height: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 90,
                child: Text(
                  item.article.author?.nickName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                size: 14,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  item.article.likeCount.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _itemTitle() {
    return Container(
      padding: EdgeInsets.all(4),
      child: Text(
        item.article.articleTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

  _itemImage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          //设置最小初始高度，防止动态图片高度时的抖动
          constraints: BoxConstraints(
            minHeight: size.width / 2 - 10,
          ),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: item.article.images[0]?.dynamicUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 2, bottom: 1),
                    child: LimitedBox(
                      maxWidth: 130,
                      child: Text(
                        item.article.pois == null ||
                                item.article.pois.length == 0
                            ? "未知"
                            : item.article.pois[0]?.poiName ?? "未知",
                        maxLines: 1,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
