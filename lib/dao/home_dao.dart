




import 'dart:convert';

import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/utils/toast_util.dart';
import 'package:http/http.dart' as http;

import 'http_request.dart';

const HOME_URL="https://www.devio.org/io/flutter_app/json/home_page.json";

//首页接口 test
class HomeDao{
//  static Future<HomeModel> fetch() async {
//    var response = await http.get(HOME_URL);
//    if(response.statusCode == 200){
//      var result = json.decode(Utf8Decoder().convert(response.bodyBytes));
//      return JsonConvert.fromJsonAsT<HomeModel>(result);
//    }else{
//      throw Exception();
//    }
//  }


  static Future<HomeModel> getHomePageData() async {
    var result = await HttpRequest.request<HomeModel>(HOME_URL);
    return result;
  }

}