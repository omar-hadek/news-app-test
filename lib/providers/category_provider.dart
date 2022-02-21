import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app_test/models/category.dart';
import 'package:news_app_test/providers/news.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];

  List<Category> get items {
    return [..._items];
  }

  Future<void> fetchAndSetCategries([String? catName]) async {
    var response;
    var extractedCategories;

    List<String> catNames = [
      'science',
      'business',
      'sports',
      'technology',
      'startup',
      'automobile',
    ];
    final List<Category> loadedcategories = [];
    try {
      for (var cat in catNames) {
        var url =
            Uri.parse("https://inshortsapi.vercel.app/news?category=$cat");

        response = await http.get(url);
        extractedCategories =
            json.decode(response.body) as Map<dynamic, dynamic>;
        print(' category name ${extractedCategories["category"].toString()}');

        loadedcategories.add(
          Category(
            id: DateTime.now().toString(),
            name: extractedCategories['category'].toString(),
            data: (extractedCategories['data'] as List<dynamic>).map((items) {
              return News(
                  author: items['author'].toString(),
                  content: items['content'].toString(),
                  date: items['date'].toString(),
                  imageUrl: items['imageUrl'].toString(),
                  readMoreUrl: items['readMoreUrl'].toString(),
                  time: items['time'].toString(),
                  title: items['title'].toString(),
                  url: items['url'].toString());
            }).toList(),
          ),
        );
      }

      _items = loadedcategories;

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
