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
  StorySection({
    Key? key,
  }) : super(key: key);

  final listStory = [
    {
      'storyUrl':
          'https://i.insider.com/5484b33a6da8119577fbada9?width=800&format=jpeg&auto=webp',
      'avatarUrl':
          'https://images.unsplash.com/photo-1615751072497-5f5169febe17?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    },
    {
      'storyUrl':
          'https://i.pinimg.com/originals/80/d3/64/80d364e09d31fcba8af274926d4332ff.jpg',
      'avatarUrl':
          'https://ae01.alicdn.com/kf/H140a3cd48cf04209b235daee3c9d5cc5y/Winter-Cute-Dog-Clothes-Cartoons-Fruit-Dog-Hoodie-Coat-Outdoor-Warm-Puppy-Small-Medium-Dogs-Pet.jpg_q50.jpg',
    },
    {
      'storyUrl':
          'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
      'avatarUrl':
          'https://i1.sndcdn.com/avatars-000600452151-38sfei-t240x240.jpg',
    },
    {
      'storyUrl':
          'https://cutecatshq.com/wp-content/uploads/2016/12/What-type-of-cat-is-this.jpg',
      'avatarUrl': 'https://i.redd.it/6giqv6zjkog21.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 20),
          ...listStory.map(
            (e) => StoryPreviewCard(
              storyUrl: e['storyUrl'],
              avatarUrl: e['avatarUrl'],
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class StoryPreviewCard extends StatelessWidget {
  late final String? storyUrl;
  late final String? avatarUrl;

  StoryPreviewCard({
    Key? key,
    required this.storyUrl,
    required this.avatarUrl,
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
            storyUrl ?? '',
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
                    backgroundImage: NetworkImage(avatarUrl ?? ''),
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
