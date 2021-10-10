import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:social/constant/colors.dart';
import 'package:social/theme/app_theme.dart';
import 'package:social/views/screens/news_feed.dart';
import 'package:social/views/screens/notifications.dart';
import 'package:social/views/screens/profile.dart';
import 'package:social/views/screens/search.dart';
import 'package:social/views/widgets/keep_alive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social',
      theme: AppTheme.dark(),
      home: MyHomeScreen(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key? key}) : super(key: key);
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final BehaviorSubject<int> _currentPageSubject =
      BehaviorSubject<int>(sync: true);
  late final Stream<int> _curentPageStream;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  _nextPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  _onPageChanged(int page) {
    _currentPageSubject.add(page);
  }

  @override
  void initState() {
    _currentPageSubject.add(0);
    _curentPageStream =
        _currentPageSubject.debounceTime(Duration(milliseconds: 50));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          onPageChanged: (page) => _onPageChanged(page),
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
            KeepAlivePage(child: NewsFeedScreen()),
            SearchScreen(),
            NotificationsScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: StreamBuilder<int>(
            stream: _curentPageStream,
            builder: (context, snapshot) {
              return BottomAppBar(
                child: Container(
                  height: 70,
                  color: kBlack,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: snapshot.data == 0 ? kWhite : kLightGray,
                        onPressed: () => _nextPage(0),
                        icon: Icon(Icons.web_outlined),
                      ),
                      IconButton(
                        color: snapshot.data == 1 ? kWhite : kLightGray,
                        onPressed: () => _nextPage(1),
                        icon: Icon(
                          Icons.search_outlined,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: kLinearGradient,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () => null,
                          icon: Icon(Icons.add_outlined),
                        ),
                      ),
                      IconButton(
                        color: snapshot.data == 2 ? kWhite : kLightGray,
                        onPressed: () => _nextPage(2),
                        icon: Icon(Icons.notifications_outlined),
                      ),
                      IconButton(
                        color: snapshot.data == 3 ? kWhite : kLightGray,
                        onPressed: () => _nextPage(3),
                        icon: Icon(Icons.account_circle_outlined),
                      ),
                    ],
                  ),
                ),
              );
            }), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
