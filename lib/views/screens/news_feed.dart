import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:social/constant/colors.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithUserName(),
      body: ListView(
        children: [StorySection()],
      ),
    );
  }
}

class StorySection extends StatelessWidget {
  const StorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 20),
          StoryPreviewCard(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class StoryPreviewCard extends StatelessWidget {
  const StoryPreviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      height: double.infinity,
      width: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Image.network(
            'https://i.insider.com/5484b33a6da8119577fbada9?width=800&format=jpeg&auto=webp',
            height: 170,
            width: 100,
            fit: BoxFit.cover,
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: kLinearGradient),
                padding: EdgeInsets.all(2),
                width: 40,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kBlack,
                  ),
                  padding: EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://demo.digityze.asia/ilearning/wp-content/themes/cera-child/assets/images/avatars/user-avatar.png'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
final AppBarWithUserName = () => AppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text('Good morning, Alex'),
      ),
      actions: [
        Center(
          child: Container(
            margin: EdgeInsets.only(right: 20),
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
              borderSide:
                  BorderSide(color: kWhite, width: 1, style: BorderStyle.solid),
              child: Icon(Icons.email_outlined),
              toAnimate: false,
            ),
          ),
        )
      ],
    );
