import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../config.dart';

class DioHttp {
  Dio _client = Dio(BaseOptions( // 直接初始化 _client
  baseUrl: Config.BaseUrl,
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 5)));

  BuildContext? context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }



  DioHttp._internal(BuildContext context) {
    if (context != this.context) {
      // 如果 context 改变，重新初始化 _client
      var options = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          extra: {'context': context});
      var client = Dio(options);
      _client = client;
      // 初始化
      this.context = context;
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return _client.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return _client.post(path, data: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(
        headers: {'Authorization': token}, contentType: 'multipart/form-data');
    return _client.post(path, data: params, options: options);
  }
}
