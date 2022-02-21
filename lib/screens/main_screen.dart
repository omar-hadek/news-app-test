import 'package:flutter/material.dart';
import 'package:news_app_test/providers/category_provider.dart';
import 'package:news_app_test/screens/navigation/discover_screen.dart';
import 'package:provider/provider.dart';
import 'navigation/home_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future _dataFuture = Future(() {});

  Future _obtainDataFuture() {
    return Provider.of<CategoryProvider>(context, listen: false)
        .fetchAndSetCategries('business');
  }

  @override
  void initState() {
    _dataFuture = _obtainDataFuture();
    super.initState();
  }

  final List<Widget> screens = const [HomeScreen(), DiscoverScreen()];

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final _viewHeight = MediaQuery.of(context).size.height;
    final _viewWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
          future: _dataFuture,
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                width: 200.0,
                child: Row(children: const [
                  CircularProgressIndicator(),
                  Text('Loading...')
                ]),
              ));
            } else if (dataSnapShot.error != null) {
              return Center(child: Text('an error occured'));
            } else {
              return screens[_index];
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _index,
          onTap: (ind) {
            if (ind >= screens.length) {
              return;
            }
            setState(() {
              _index = ind;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'search'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'search'),
          ]),
    );
  }
}
