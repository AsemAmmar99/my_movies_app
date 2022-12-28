import 'package:dio/dio.dart';

import '../../../constants/constants.dart';

class MyDio{

  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
}) async{
    return await dio!.get(endPoint, queryParameters: query!);
}

  static Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> query,
    Map<String, dynamic>? data,
  }) async{
    dio!.options.headers =
    {
      'Content-Type': 'application/json',
    };
    return await dio!.post(endPoint, queryParameters: query, data: data);
  }

}