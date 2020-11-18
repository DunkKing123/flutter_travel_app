import 'dart:async';
import 'dart:convert';

import 'package:flutterapp/dao/http_request.dart';
import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/model/search_model.dart';
import 'package:flutterapp/utils/toast_util.dart';
import 'package:http/http.dart' as http;

import 'home_dao.dart';

///搜索接口
class SearchDao {
//  static Future<SearchModel> fetch(String url, String text) async {
//    final response = await http.get(url);
//    if (response.statusCode == 200) {
//      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
//      var result = json.decode(utf8decoder.convert(response.bodyBytes));
//      //只有当当前输入的内容和服务端返回的内容一致时才渲染
//      SearchModel model = JsonConvert.fromJsonAsT<SearchModel>(result);
//      model?.keyword = text;
//      return model;
//    } else {
//      ToastUtil.toast("网络异常");
//      throw Exception();
//    }
//  }


  static Future<SearchModel> search(String url, String text) async {
    var result = await HttpRequest.request<SearchModel>(url);
    result?.keyword = text;
    return result;
  }

}