import 'package:news_app/features/news/model/source_model.dart';

class NewsModel {
  NewsModel({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      source: SourceModel.fromMap(map['source']),
      author: map['author'] as String?,
      title: map['title'] as String,
      description: map['description'] as String?,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: DateTime.parse(map['publishedAt']),
      content: map['content'] as String?,
    );
  }

  final SourceModel source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;
}
