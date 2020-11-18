


import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/utils/toast_util.dart';

class HTTPConfig {
//  static const baseURL = BASEURL;
  static const timeout = 8000;
}
class HttpRequest {
  static final BaseOptions options = BaseOptions(
      headers: {HttpHeaders.acceptHeader: "accept: application/json"},
      /*baseUrl: HTTPConfig.baseURL,*/ connectTimeout: HTTPConfig.timeout);
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {String method = 'GET', Map<String, dynamic> params, Interceptor inter,dynamic data}) async {
    // 1.请求的单独配置
    final options = Options(method: method);

    // 2.添加第一个拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          // 1.在进行任何网络请求的时候, 可以添加一个loading显示

          // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token

          // 3.对参数进行一些处理,比如序列化处理等
//          print("拦截了请求");
          return options;
        },
        onResponse: (Response response) {
//          print("拦截了响应");
          return response;
        },
        onError: (DioError error) {
//          print("拦截了错误");
          return error;
        }
    );
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + data.toString());

    // 3.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options,data: data);
      print('响应数据：' + response.toString());
      return JsonConvert.fromJsonAsT<T>(response.data);
    } on DioError catch(e) {
      ToastUtil.toast(e.toString());
      print('请求出错：' + e.toString());
      throw Exception(e);
    }
  }
}
