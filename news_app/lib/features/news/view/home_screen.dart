import 'package:flutter/material.dart';
import 'package:news_app/features/news/view/widgets/news_list_builder.dart';
import 'package:news_app/features/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (context.mounted) {
        context.read<NewsViewModel>().fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Headlines'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NewsViewModel>().onThemeChange();
            },
            icon:
                context.read<NewsViewModel>().theme == ThemeMode.dark
                    ? Icon(Icons.dark_mode)
                    : Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for news...',
              ),
              onChanged: (value) {
                context.read<NewsViewModel>().search(value);
              },
            ),
            SizedBox(height: 24),
            Expanded(child: NewsListBuilder()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
