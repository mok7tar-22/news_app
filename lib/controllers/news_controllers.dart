import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/news_api_manager.dart';
import 'package:news_app/models/source.dart';

class NewsControllers with ChangeNotifier {
  Future<List<Articles>?> getArticles(String category) async {
    try {
      List<Articles> articles = [];
      final articlesAsJson = await NewsApiManager.getArticles(category);
      articles = articlesAsJson.map((e) => Articles.fromJson(e)).toList();
      return articles;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<List<Articles>?> search(String text) async {
    try {
      List<Articles>? articles = [];
      final articlesAsJson = await NewsApiManager.search(text);

      articles = articlesAsJson?.map((e) => Articles.fromJson(e)).toList();
      return articles;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
