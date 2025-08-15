import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/news/model/news_model.dart';

class ViewNewsScreen extends StatelessWidget {
  final NewsModel news;

  const ViewNewsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                    '${news.urlToImage}',
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, _, _) => Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                  ),
                ),
                SizedBox(height: 24),
                Positioned(
                  top: 240,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              news.author ?? 'Unknown',
                              style: TextStyle(color: Colors.grey.shade900),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          news.title,
                          style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          news.content ?? 'Content not available',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
