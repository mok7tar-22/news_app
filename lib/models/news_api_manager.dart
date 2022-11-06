import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsApiManager {
  static String apiUrl = 'https://newsapi.org/v2/';
  static String apiKey = '2b34ff5a199a4a71a29ffe83a7ab9179';

  static Future<List<dynamic>> getArticles(String category) async {
    String url = '${apiUrl}top-headlines';
    Dio dio = Dio();
    Map<String, String> parms = {
      'apiKey': apiKey,
      'category': category,
      'country': "eg"
    };
    Response response = await dio.get(url, queryParameters: parms);
    return response.data['articles'];
  }

  static Future<List<dynamic>?> search(String text) async {
    try {
      String url = '${apiUrl}everything';
      Dio dio = Dio();
      Map<String, String> parms = {
        'apiKey': apiKey,
        'q': text,
      };
      Response response = await dio.get(url, queryParameters: parms);
      return response.data['articles'];
    } on DioError catch (e) {
      return null;
    }
  }
}
