import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:social/constant/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social',
      theme: ThemeData(
          fontFamily: 'HKGrotesk',
          primaryColor: kDarkBlack,
          scaffoldBackgroundColor: kDarkBlack,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(elevation: 0)),
      home: MyHomePage(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good morning, Alex'),
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: kWhite,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Badge(
                shape: BadgeShape.circle,
                badgeColor: kPink,
                position: BadgePosition(top: 0, end: 0),
                borderSide: BorderSide(
                    color: kWhite, width: 1, style: BorderStyle.solid),
                child: Icon(Icons.email_outlined),
                toAnimate: false,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
