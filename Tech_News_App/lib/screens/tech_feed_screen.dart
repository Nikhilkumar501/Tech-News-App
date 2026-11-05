import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tech_article.dart';
import '../providers/tech_news_provider.dart';
import '../widgets/tech_article_card.dart';
import 'tech_article_detail_screen.dart';
import 'tech_bookmarks_screen.dart';
import 'create_tech_post_screen.dart';

class TechFeedScreen extends StatefulWidget {
  const TechFeedScreen({super.key});

  @override
  State<TechFeedScreen> createState() => _TechFeedScreenState();
}

class _TechFeedScreenState extends State<TechFeedScreen> {
  final _searchController = TextEditingController();
  String _category = 'All';
  static const _categories = ['All', 'AI', 'Gadgets', 'Software', 'Startups'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TechNewsProvider>();
    final query = _searchController.text.trim().toLowerCase();
    final List<TechArticle> visible = provider.articles.where((article) {
      final matchesText = article.title.toLowerCase().contains(query) ||
          article.summary.toLowerCase().contains(query);
      final matchesCategory = _category == 'All' || article.category == _category;
      return matchesText && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech News App'),
        actions: [
          IconButton(
            tooltip: 'Bookmarks',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TechBookmarksScreen())),
            icon: const Icon(Icons.bookmarks_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateTechPostScreen())),
        icon: const Icon(Icons.add),
        label: const Text('Create post'),
      ),
      body: RefreshIndicator(
        onRefresh: provider.load,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 90),
          children: [
            Text('Technology, made easier to follow', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Explore AI, gadgets, software, and startup stories.'),
            const SizedBox(height: 8),
            const Text('Starter stories are fictional demo content, not live technology news.', style: TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 14),
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search technology stories...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) => ChoiceChip(
                  label: Text(_categories[index]),
                  selected: _category == _categories[index],
                  onSelected: (_) => setState(() => _category = _categories[index]),
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (provider.isLoading)
              const Padding(padding: EdgeInsets.all(40), child: Center(child: CircularProgressIndicator()))
            else if (provider.errorMessage != null)
              Center(child: Column(children: [
                Text(provider.errorMessage!),
                TextButton(onPressed: provider.load, child: const Text('Retry')),
              ]))
            else if (visible.isEmpty)
              const Padding(padding: EdgeInsets.all(24), child: Text('No stories found. Try another search or create a post.', textAlign: TextAlign.center))
            else ...[
              Text('${visible.length} technology stories', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              ...visible.map((article) => TechArticleCard(
                    article: article,
                    isBookmarked: provider.isBookmarked(article.id),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TechArticleDetailScreen(article: article))),
                    onBookmarkTap: () => provider.toggleBookmark(article.id),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}
