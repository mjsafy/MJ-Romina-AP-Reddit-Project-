import 'Comment.dart';

import 'package:flutter/cupertino.dart';
import 'Channel.dart';
import 'User.dart';

class Post {
  User posterUser;
  Channel posterChannel;
  DateTime releaseDate;
  String content;
  int likes = 0;
  int dislikes = 0;
  int commentsNo = 0;
  List<Comment> comments = [];
  List<User> likers = [];

  Post({
    this.posterUser,
    this.posterChannel,
    this.releaseDate,
    this.content,
    this.likes,
    this.dislikes,
    this.commentsNo,
    this.comments,
  });
}
