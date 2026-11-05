import 'package:flutter/material.dart';

import '../models/tech_article.dart';

class TechArticleCard extends StatelessWidget {
  const TechArticleCard({
    super.key,
    required this.article,
    required this.isBookmarked,
    required this.onTap,
    required this.onBookmarkTap,
  });

  final TechArticle article;
  final bool isBookmarked;
  final VoidCallback onTap;
  final VoidCallback onBookmarkTap;

  IconData get _icon {
    switch (article.category) {
      case 'AI':
        return Icons.auto_awesome_outlined;
      case 'Gadgets':
        return Icons.devices_outlined;
      case 'Startups':
        return Icons.rocket_launch_outlined;
      default:
        return Icons.code_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(_icon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.category.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    const SizedBox(height: 4),
                    Text(article.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(article.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    Text('${article.author} • ${article.publishedAt}', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              IconButton(
                tooltip: isBookmarked ? 'Remove bookmark' : 'Bookmark article',
                onPressed: onBookmarkTap,
                icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: isBookmarked ? Colors.blue : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
