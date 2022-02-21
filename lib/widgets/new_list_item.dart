import 'package:flutter/material.dart';

import 'package:news_app_test/screens/news_detail_screen.dart';
import 'package:news_app_test/widgets/texts/headline_text.dart';
import 'package:news_app_test/widgets/texts/hint_text.dart';

class NewsListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String category;
  final String content;
  final String url;

  const NewsListItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.category,
    required this.content,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(right: 50.0),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsDetailScreen(
                imageUrl: imageUrl,
                title: title,
                category: category,
                url: url,
                content: content)));
      },
      leading: SizedBox(
        width: 80.0,
        height: 80.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(imageUrl, fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
      title: HeadlineText(text: title),
      subtitle: Wrap(
        clipBehavior: Clip.none,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          HintText(text: time),
          const HintText(text: '120 views'),
        ],
      ),
    );
  }
}
