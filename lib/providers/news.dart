import 'package:flutter/material.dart';

class News {
  final String author;
  final String content;
  final String date;
  final String imageUrl;
  final String readMoreUrl;
  final String time;
  final String title;
  final String url;

  News(
      {required this.author,
      required this.content,
      required this.date,
      required this.imageUrl,
      required this.readMoreUrl,
      required this.time,
      required this.title,
      required this.url});
}
