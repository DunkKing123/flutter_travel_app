import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterapp/utils/statusbar_util.dart';

const CATCH_URLS = [
  'm.ctrip.com/',
  'm.ctrip.com/html5/',
  'm.ctrip.com/html5',
  "m.ctrip.com/html5/you/"
];

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  const WebView(
      {Key key,
      this.url,
      this.statusBarColor = "ffffff",
      this.title = "",
      this.hideAppBar = false,
      this.backForbid = false})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChange;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    _onUrlChange = flutterWebviewPlugin.onUrlChanged.listen((String url) {});
    _onHttpError =
        flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          print("WebViewState.startLoad: " + state.url);
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForbid??false) {
              flutterWebviewPlugin.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    _onUrlChange.cancel();
    _onHttpError.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColor = widget.statusBarColor??"ffffff";
    Color backButtonColor;
    if (statusBarColor == "ffffff") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Padding(padding :EdgeInsets.only(top: StatusBarUtil.getStatusBarHeight(context)),
      child: Column(
          children: <Widget>[
          _appBar(Color(int.parse("0xff" + statusBarColor)), backButtonColor),
    Expanded(
    child: WebviewScaffold(
    url: widget.url,
    withLocalStorage: true,
    withZoom: true,
    hidden: true,
    initialChild: Container(
    color: Colors.white,
    child: Center(
    child: CircularProgressIndicator(),
    ),
    ),
    ),
    )
    ],
    ),),
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar??false) {
      return Container(
        color: backgroundColor,
        height: 28,
      );
    } else {
      return Container(
        color: backgroundColor,
        height: 73,
//        padding: EdgeInsets.only(top: StatusBarUtil.getStatusBarHeight(context)),
        alignment: AlignmentDirectional.center,
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(Icons.close, color: backButtonColor, size: 26),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: backButtonColor, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }
}
