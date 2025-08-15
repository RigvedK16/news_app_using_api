import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/model/news_model.dart';
import 'package:news_app/features/news/service/news_api_service.dart';

class NewsViewModel extends ChangeNotifier {
  final _service = NewsApiService();

  List<NewsModel>? _news = [];
  List<NewsModel>? get news => _news;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ThemeMode _theme = ThemeMode.light;
  ThemeMode get theme => _theme;

  Future<void> fetch() async {
    _isLoading = true;
    _news = await _service.fetch();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> search(String query) async {
    _isLoading = true;
    _news = await _service.fetch(query: query);
    _isLoading = false;
    notifyListeners();
  }

  void onThemeChange() {
    _theme = _theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
