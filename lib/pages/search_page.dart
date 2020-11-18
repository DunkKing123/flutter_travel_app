import 'package:flutter/material.dart';
import 'package:flutterapp/dao/search_dao.dart';
import 'package:flutterapp/model/search_model.dart';
import 'package:flutterapp/pages/speak_page.dart';
import 'package:flutterapp/utils/navigator_util.dart';
import 'package:flutterapp/widget/search_bar.dart';
import 'package:flutterapp/widget/webview.dart';

import 'home_page.dart';

const TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];
const URL =
    'https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';

class SearchPage extends StatefulWidget {
  final String searchUrl;
  final String keyword;
  final String hint;
  final bool hideLeft;

  const SearchPage(
      {Key key, this.searchUrl, this.keyword, this.hint, this.hideLeft = false})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    /*with AutomaticKeepAliveClientMixin*/ {
  SearchModel searchModel;
  String keyword;

  @override
  void initState() {
    if (widget.keyword != null) {
      _search(widget.keyword);
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
//    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
        children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: searchModel?.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return _item(index);
                    }),
              ))
        ],
      ),
    );
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
              padding: EdgeInsets.only(top: 25),
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: SearchBar(
                hideLeft: widget.hideLeft,
                defaultText: widget.keyword,
                hint: widget.hint,
                speakClick: _jumpToSpeak,
                rightButtonClick: () {
//                  FocusScope.of(context).requestFocus(FocusNode());
                },
                leftButtonClick: () {
//                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.pop(context);
                },
                onChanged: _search,
              )),
        )
      ],
    );
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }

//  @override
//  bool get wantKeepAlive => true;

  void _search(String text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        searchModel = null;
      });
      return;
    }

    //考虑到searchUrl会不定期的更新，优先服务端配置返回的searchUrl
    String url = (HomePage.config?.searchUrl ?? widget.searchUrl) + text;
    SearchDao.search(url, text).then((SearchModel model) {
      //只有当当前输入的内容和服务端返回的内容一致时才渲染
      if (model.keyword == keyword) {
        setState(() {
          searchModel = model;
        });
      }
    });
//        .catchError((e) {
//      print(e);
//    });
  }

  Widget _item(int position) {
    if (searchModel == null || searchModel.data == null) return null;
    SearchModelData item = searchModel.data[position];
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            WebView(
              url: item.url,
              title: '详情',
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(1),
              child: Image(
                width: 26,
                height: 26,
                image: AssetImage(_typeImage(item.type)),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: _title(item),
                ),
                Container(
                  width: 300,
                  child: _subTitle(item),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _typeImage(String type) {
    if (type == null) return 'images/type_travelgroup.png';
    String path = 'travelgroup';
    for (final val in TYPES) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return 'images/type_$path.png';
  }

  _title(SearchModelData item) {
    if (item == null) {
      return null;
    }
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, searchModel.keyword));
    spans.add(TextSpan(
        text: ' ' + (item.districtname ?? '') + ' ' + (item.zonename ?? ''),
        style: TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(text: TextSpan(children: spans));
  }

  _subTitle(SearchModelData item) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: item.price ?? '',
          style: TextStyle(fontSize: 16, color: Colors.orange),
        ),
        TextSpan(
          text: ' ' + (item.star ?? ''),
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ]),
    );
  }

  //把搜索关键字变成高亮的方法
  Iterable<TextSpan> _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;

    print(word);
    //搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();

    wordL = wordL.replaceAll(keywordL, "???"+keywordL+"???");

    List<String> arr = wordL.split("???");

    print(arr);
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.deepOrange);
    //'wordwoc'.split('w') -> [, ord, oc] @https://www.tutorialspoint.com/tpcg.php?p=wcpcUA

    for (int i = 0; i < arr.length; i++) {
      if (arr[i].contains(keywordL)) {
        //搜索关键字高亮忽略大小写
        spans.add(TextSpan(text: arr[i], style: keywordStyle));
      } else {
        spans.add(TextSpan(text: arr[i], style: normalStyle));
      }
    }

//    int preIndex = 0;
//    for (int i = 0; i < arr.length; i++) {
//      if (i != 0) {
//        //搜索关键字高亮忽略大小写
//        preIndex = wordL.indexOf(keywordL, preIndex);
//        spans.add(TextSpan(
//            text: word.substring(preIndex, preIndex + keyword.length),
//            style: keywordStyle));
//      }
//      String val = arr[i];
//      if (val != null && val.length > 0) {
//        spans.add(TextSpan(text: val, style: normalStyle));
//      }
//    }
    return spans;
  }
}
