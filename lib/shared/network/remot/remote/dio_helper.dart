import 'dart:convert';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://ibtikarsoft.net/',
      receiveDataWhenStatusError: true,
    ));
  }
  static Future<Response> getdata(
      {required String url,
        Map<String, dynamic>? query,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> putdata(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> postdata(
      {required String url,
        Map<String, dynamic>? query,
        required var data,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
