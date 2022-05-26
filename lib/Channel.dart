import 'package:flutter/cupertino.dart';

import 'Post.dart';
import 'User.dart';

class Channel{
  String name;
  Image image;
  User admin;
  List<Post> postList;

  Channel(this.name, this.image, this.admin);
}