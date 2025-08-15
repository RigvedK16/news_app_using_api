import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/model/news_model.dart';
import 'package:news_app/features/news/view/view_news_screen.dart';
import 'package:news_app/features/news/view/widgets/news_list_tile.dart';
import 'package:news_app/features/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsListBuilder extends StatelessWidget {
  const NewsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<NewsViewModel, Tuple2<List<NewsModel>?, bool>>(
      selector: (_, vm) => tuple2(vm.news, vm.isLoading),
      builder: (context, tuple, child) {
        final news = tuple.value1;
        final isLoading = tuple.value2;

        if (news == null) return Center(child: Text('No news yet...'));
        return ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            if (isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewNewsScreen(news: news[index]),
                  ),
                );
              },
              child: NewsListTile(news: news[index]),
            );
          },
        );
      },
    );
  }
}
