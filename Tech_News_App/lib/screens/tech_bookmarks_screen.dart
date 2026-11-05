import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tech_news_provider.dart';
import '../widgets/tech_article_card.dart';
import 'tech_article_detail_screen.dart';

class TechBookmarksScreen extends StatelessWidget {
  const TechBookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TechNewsProvider>();
    final bookmarks = provider.bookmarks;
    return Scaffold(
      appBar: AppBar(title: const Text('Saved tech stories')),
      body: bookmarks.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(28),
                child: Text('No saved stories yet. Tap the bookmark icon on a story to save it.', textAlign: TextAlign.center),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: bookmarks
                  .map((article) => TechArticleCard(
                        article: article,
                        isBookmarked: true,
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TechArticleDetailScreen(article: article))),
                        onBookmarkTap: () => provider.toggleBookmark(article.id),
                      ))
                  .toList(),
            ),
    );
  }
}
