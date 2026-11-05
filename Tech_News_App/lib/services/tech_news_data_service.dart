import '../models/tech_article.dart';

class TechNewsDataService {
  // Fictional demo stories for layout and interaction testing; not live news.
  static const List<TechArticle> sampleArticles = [
    TechArticle(
      id: 'tech_demo_001',
      title: 'How small teams can prototype AI assistants',
      category: 'AI',
      summary: 'A fictional explainer on planning and testing a small AI assistant prototype.',
      body: 'This demonstration story describes a hypothetical development team that starts with one narrow task, prepares example inputs, evaluates output quality, and improves the experience using user feedback. It is sample app content, not a report about a real product launch or research result.',
      author: 'Tech Desk Demo',
      publishedAt: 'Demo story',
    ),
    TechArticle(
      id: 'tech_demo_002',
      title: 'What to compare before choosing a new smartphone',
      category: 'Gadgets',
      summary: 'A sample guide covering battery, display, software support, and camera needs.',
      body: 'This fictional guide demonstrates a gadget article page. It suggests comparing device features against personal needs and budget rather than relying on one specification. The content is illustrative and does not review a specific product.',
      author: 'Tech Desk Demo',
      publishedAt: 'Demo story',
    ),
    TechArticle(
      id: 'tech_demo_003',
      title: 'Open-source tools help students learn app development',
      category: 'Software',
      summary: 'A fictional story about using community-built tools for learning software skills.',
      body: 'This sample article illustrates software coverage. It describes a hypothetical student group exploring documentation, version control, testing tools, and small practice projects. It is not a current announcement or claim about a named software release.',
      author: 'Tech Desk Demo',
      publishedAt: 'Demo story',
    ),
    TechArticle(
      id: 'tech_demo_004',
      title: 'Student founders turn campus ideas into prototypes',
      category: 'Startups',
      summary: 'A fictional startup feature about validating a problem before building a product.',
      body: 'This demonstration story follows a hypothetical student team that interviews potential users, defines a focused problem, builds a basic prototype, and gathers feedback. It is sample content, not a real startup profile.',
      author: 'Tech Desk Demo',
      publishedAt: 'Demo story',
    ),
    TechArticle(
      id: 'tech_demo_005',
      title: 'Understanding privacy settings in everyday apps',
      category: 'Software',
      summary: 'A sample explainer about reviewing permissions and account privacy options.',
      body: 'This fictional educational article demonstrates how an explanatory technology story can be presented. A real version should be reviewed against current product documentation and should link to authoritative sources.',
      author: 'Tech Desk Demo',
      publishedAt: 'Demo story',
    ),
    TechArticle(
      id: 'tech_demo_006',
      title: 'A beginner checklist for evaluating AI tools',
      category: 'AI',
      summary: 'A sample checklist covering accuracy, privacy, usability, and cost.',
      body: 'This sample story presents a hypothetical checklist for comparing AI tools: define the task, test representative examples, review limitations, check privacy terms, and compare ongoing costs. It is generic demonstration content rather than a current product assessment.',
      author: 'Tech Desk Demo',
      publishedAt: 'Demo story',
    ),
  ];
}
