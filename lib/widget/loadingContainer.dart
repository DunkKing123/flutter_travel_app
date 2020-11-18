import 'package:flutter/material.dart';
//加载蒙层组件
class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContainer(
      {Key key, @required this.isLoading, this.cover, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(cover){
      return Stack(
        children: <Widget>[
          child,
          isLoading ? _loadingView : Container()
        ],
      );
    }else{
      return isLoading ? _loadingView : child;

    }

  }


  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}
