import 'package:flutter/material.dart';
import 'package:news_app_test/providers/category_provider.dart';
import 'package:news_app_test/widgets/new_list_item.dart';
import 'package:news_app_test/widgets/srearch_input.dart';
import 'package:news_app_test/widgets/texts/big_text.dart';
import 'package:news_app_test/widgets/texts/header_text.dart';
import 'package:news_app_test/widgets/texts/hint_text.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 6, vsync: this);
    return Consumer<CategoryProvider>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.menu, size: 30.0),
            const SizedBox(height: 40.0),
            const BigText(text: 'Discover'),
            const SizedBox(height: 10.0),
            const HintText(text: 'News from all over the world'),
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 30.0),
              child: SearchInput(),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                //This is for background color
                color: Colors.white.withOpacity(0.0),
                //This is for bottom border that is needed
                border: const Border(
                    bottom: BorderSide(color: Colors.black, width: 0.8)),
              ),
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                tabs: data.items.map((cat) {
                  return Tab(
                    child: Center(
                      child: HeaderText(text: cat.name),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: data.items.map((cat) {
                  return ListView.builder(
                      itemCount: cat.data.length,
                      itemBuilder: (context, index) {
                        return NewsListItem(
                          title: cat.data[index].title,
                          imageUrl: cat.data[index].imageUrl,
                          time: cat.data[index].time,
                          url: cat.data[index].url,
                          content: cat.data[index].content,
                          category: cat.name,
                        );
                      });
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
