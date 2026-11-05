import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:tech_news_app/models/tech_article.dart';
import 'package:tech_news_app/providers/tech_news_provider.dart';
import 'package:tech_news_app/screens/tech_feed_screen.dart';
import 'package:tech_news_app/services/tech_news_storage_service.dart';

class FakeTechNewsStorageService extends TechNewsStorageService {
  @override
  Future<List<TechArticle>> loadCustomArticles() async => [];

  @override
  Future<Set<String>> loadBookmarkIds() async => {};
}

void main() {
  testWidgets('tech feed displays sample technology stories', (tester) async {
    final provider = TechNewsProvider(FakeTechNewsStorageService());
    await provider.load();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: provider,
        child: const MaterialApp(home: TechFeedScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Tech News App'), findsOneWidget);
    expect(find.text('How small teams can prototype AI assistants'), findsOneWidget);
  });
}
