import 'package:flutter/material.dart';
import 'package:news_app_test/providers/category_provider.dart';
import 'package:news_app_test/widgets/blur_button.dart';
import 'package:news_app_test/widgets/texts/header_text.dart';
import 'package:news_app_test/widgets/texts/headline_text.dart';
import 'package:news_app_test/widgets/texts/hint_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    // required this.viewHeight,
    // required this.viewWidth,
  }) : super(key: key);

  // final double viewHeight;
  // final double viewWidth;

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;
    final viewWidth = MediaQuery.of(context).size.width;
    return Consumer<CategoryProvider>(builder: (context, data, child) {
      return Column(
        children: [
          SizedBox(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  child: Image.network(data.items[0].data[1].imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const Center(child: CircularProgressIndicator());
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                        ),
                        iconSize: 30.0,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 70.0,
                      ),
                      const BlurButton(
                        text: 'news of the day',
                      ),
                      SizedBox(height: 10),
                      HeaderText(
                          text: data.items[0].data[1].title,
                          size: 20.0,
                          color: Colors.white),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('learn more',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )),
                          IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward),
                            iconSize: 25.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: viewHeight * 0.5,
            // decoration: const BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(30.0),
            //     bottomRight: Radius.circular(30.0),
            //   ),
            // ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HeaderText(text: 'Breaking News'),
                HeadlineText(text: 'More'),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: data.items[0].data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  height: viewHeight * 0.3,
                  width: viewWidth * 0.56,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: viewHeight * 0.18,
                        width: viewWidth * 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.network(
                              data.items[0].data[index].imageUrl,
                              fit: BoxFit.cover, loadingBuilder:
                                  (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return const Center(
                                child: CircularProgressIndicator());
                          }),
                        ),
                      ),
                      HeadlineText(
                        text: data.items[0].data[index].title,
                      ),
                      HintText(text: data.items[0].data[index].time),
                      HintText(text: data.items[0].data[index].author),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
