import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/tech_article.dart';

class TechNewsStorageService {
  static const _customArticlesKey = 'custom_tech_articles';
  static const _bookmarksKey = 'tech_bookmark_ids';

  Future<List<TechArticle>> loadCustomArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_customArticlesKey);
    if (raw == null || raw.isEmpty) return [];
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((item) => TechArticle.fromJson(Map<String, dynamic>.from(item as Map)))
        .toList();
  }

  Future<void> saveCustomArticles(List<TechArticle> articles) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _customArticlesKey,
      jsonEncode(articles.map((article) => article.toJson()).toList()),
    );
  }

  Future<Set<String>> loadBookmarkIds() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_bookmarksKey) ?? []).toSet();
  }

  Future<void> saveBookmarkIds(Set<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_bookmarksKey, ids.toList());
  }
}
