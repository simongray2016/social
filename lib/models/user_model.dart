import 'package:social/models/story_model.dart';

class User {
  late final String userName;
  late final String avatarUrl;
  late final List<Story> stories;

  User({
    required this.userName,
    required this.avatarUrl,
    required this.stories,
  });
}
