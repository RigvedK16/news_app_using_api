import 'package:flutter/material.dart';
import 'package:news_app/features/news/view/home_screen.dart';
import 'package:news_app/features/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsViewModel(),
      child: Selector<NewsViewModel, ThemeMode>(
        selector: (_, vm) => vm.theme,
        builder: (context, theme, child) {
          return MaterialApp(
            themeMode: theme,
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
