import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/features/news/model/news_model.dart';

class NewsApiService {
  final _client = Client();

  Future<List<NewsModel>?> fetch({String query = ''}) async {
    final url =
        query.isNotEmpty
            ? 'https://newsapi.org/v2/everything?q=${query}&apiKey=2b1b78720b524e53a56f1fc5465b9370'
            : 'https://newsapi.org/v2/top-headlines?country=us&apiKey=2b1b78720b524e53a56f1fc5465b9370';

    final response = await _client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final news =
          (data['articles'] as List)
              .map((mpp) => NewsModel.fromMap(mpp))
              .toList();
      return news;
    } else {
      print('Invalid response received');
      return null;
    }
  }
}
