import 'dart:async';
import 'dart:convert';

import 'package:flutterapp/dao/http_request.dart';
import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/model/travel_model.dart';
import 'package:flutterapp/model/travel_tab_model.dart';
import 'package:flutterapp/utils/toast_util.dart';
import 'package:http/http.dart' as http;

///旅拍页接口

var Params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {'cid': "09031014111431397988"},
  "contentType": "json"
};

class TravelDao {
//  static Future<TravelModel> fetchTravelData(
//      String url,Map params, String groupChannelCode, int pageIndex, int pageSize) async {
//    Map paramsMap = params['pagePara'];
//    paramsMap['pageIndex'] = pageIndex;
//    paramsMap['pageSize'] = pageSize;
//    params['groupChannelCode'] = groupChannelCode;
//    final response = await http.post(url, body: jsonEncode(params));
//    if (response.statusCode == 200) {
//      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
//      var result = json.decode(utf8decoder.convert(response.bodyBytes));
//      return JsonConvert.fromJsonAsT<TravelModel>(result);
//    } else {
//      ToastUtil.toast("网络异常");
//      throw Exception('Failed to load travel');
//    }
//  }


//  static Future<TravelTabModel> fetchTravelTab() async {
//    final response = await http
//        .get('http://www.devio.org/io/flutter_app/json/travel_page.json');
//    if (response.statusCode == 200) {
//      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
//      var result = json.decode(utf8decoder.convert(response.bodyBytes));
//      return JsonConvert.fromJsonAsT<TravelTabModel>(result);
//    } else {
//      ToastUtil.toast("网络异常");
//      throw Exception('Failed to load travel_page.json');
//    }
//  }


  static Future<TravelTabModel> fetchTravelTab() async {

    var result = await HttpRequest.request<TravelTabModel>('http://www.devio.org/io/flutter_app/json/travel_page.json');
    return result;
  }



  static Future<TravelModel> fetchTravelData(
      String url,Map params, String groupChannelCode, int pageIndex, int pageSize) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = pageIndex;
    paramsMap['pageSize'] = pageSize;
    params['groupChannelCode'] = groupChannelCode;
    var result = await HttpRequest.request<TravelModel>(url,method: "POST",data: params);
    return result;

  }

}
