import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/news/model/news_model.dart';

class NewsListTile extends StatelessWidget {
  final NewsModel news;

  const NewsListTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 140,
      margin: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title,
                          style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          news.description ?? 'No description available',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 120),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 16,
            right: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                '${news.urlToImage}',
                fit: BoxFit.cover,
                width: 100,
                errorBuilder:
                    (_, _, _) => Image.asset(
                      'assets/images/placeholder.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: double.infinity,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
