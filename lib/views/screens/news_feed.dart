import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:social/constant/colors.dart';
import 'package:social/views/widgets/skeleton_loading.dart';

class NewsFeedScreen extends StatelessWidget {
  final list = List.filled(100, PostSection(), growable: true);
  final _scrollController = ScrollController();

  NewsFeedScreen({Key? key}) : super(key: key);

  void _scrollToTop(BuildContext context) {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );

    context.read<BottomNavigationCubit>().pageScrolled();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomNavigationCubit, BottomNavigationState>(
      listener: (context, state) {
        if (state.isScrollToTop) _scrollToTop(context);
      },
      child: Scaffold(
        appBar: AppBarWithUserName(),
        body: ListView(
          controller: _scrollController,
          children: [
            StorySection(),
            ...list,
          ],
        ),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  const PostSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(17),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i1.sndcdn.com/avatars-000600452151-38sfei-t240x240.jpg'),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daniel Trương',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            '20m ago',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => null,
                    icon: Icon(Icons.more_vert),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: RichText(
                  text: TextSpan(
                    text: 'I try my best \n~Daniel Truong',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SocialActionButton(
                        icon: Icons.thumb_up_outlined,
                        text: '2,345',
                      ),
                      SizedBox(width: 20),
                      SocialActionButton(
                        icon: Icons.textsms_outlined,
                        text: '45',
                      ),
                      SizedBox(width: 20),
                      SocialActionButton(
                        icon: Icons.share_outlined,
                        text: '120',
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.bookmark_outline,
                      size: 22,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}

class SocialActionButton extends StatelessWidget {
  late final IconData icon;
  late final String text;

  SocialActionButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
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
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kGray,
            style: BorderStyle.solid,
            width: 0.5,
          ),
        ),
      ),
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
          SkeletonLoadingContainer(
            loading: false,
            child: Image.network(
              storyUrl ?? '',
              height: 170,
              width: 100,
              fit: BoxFit.cover,
            ),
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
                  child: SkeletonLoadingContainer(
                    loading: false,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl ?? ''),
                    ),
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

class AppBarWithUserName extends StatefulWidget implements PreferredSizeWidget {
  AppBarWithUserName({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AppBarWithUserNameState createState() => _AppBarWithUserNameState();
}

class _AppBarWithUserNameState extends State<AppBarWithUserName> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Good morning, Alex',
          style: Theme.of(context).textTheme.headline1,
        ),
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
  }
}
