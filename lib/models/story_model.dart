class Story {
  late final String? imgUrl;
  late final StoryText? storyText;
  late final DateTime createAt;

  Story({
    this.imgUrl,
    this.storyText,
    required this.createAt,
  });
}

class StoryText {
  late final String text;

  StoryText({required this.text});
}
