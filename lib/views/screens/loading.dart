import 'package:flutter/material.dart';
import 'package:social/constant/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kBlack,
        body: Center(
          child: Image(
            width: 130,
            image: AssetImage('assets/images/launch_image.png'),
          ),
        ),
      ),
    );
  }
}
