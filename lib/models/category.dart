import 'package:news_app_test/providers/news.dart';

class Category {
  final String id;
  final String name;
  final List<News> data;

  Category({required this.id, required this.name, required this.data});
}
