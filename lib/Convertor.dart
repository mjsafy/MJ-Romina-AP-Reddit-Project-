import 'dart:io';

import 'package:reddit/Channel.dart';
import 'package:reddit/Post.dart';
import 'package:reddit/User.dart';

class Convertor {
  //uname:password-email
  static User getUser(String command) {
    List<String> split = command.split(":");
    String uname = split.elementAt(0);
    String password = split.elementAt(1).split("-").elementAt(0);
    String email = split.elementAt(1).split("-").elementAt(1);
    return User(username: uname, password: password, email: email);
  }

  //t1-d1-c1/t2-d2-c2/.../\n
  static List<Post> getPosts(String command) {
    List<String> split = command.split("/");
    List<Post> posts = [];
    for (var element in split) {
      if (!element.startsWith("\n")) {
        posts.add(getPost(element));
      }
    }
    return posts;
  }

  //title-desc-c name
  static Post getPost(String command) {
    List<String> split = command.split("-");
    String title = split.elementAt(0);
    String desc = split.elementAt(1);
    String channelName = split.elementAt(2);
    Channel c;
    () async {
      await Socket.connect("10.0.2.2", 555).then(
        (ss) {
          ss.write("getChannel-" + channelName);
          ss.flush();
          ss.listen((response) {
            String channel = String.fromCharCodes(response);
            c = getChannel(channel);
          });
        },
      );
    };
    return Post(title: title, content: desc, posterChannel: c);
  }

  //c name-admin uname
  static Channel getChannel(String command) {
    String name = command.split("-").elementAt(0);
    String adminUName = command.split("-").elementAt(1);
    User admin;
    () async {
      await Socket.connect("10.0.2.2", 555).then(
        (ss) {
          ss.write("getUser-" + adminUName);
          ss.flush();
          ss.listen((response) {
            String user = String.fromCharCodes(response);
            admin = getUser(user);
          });
        },
      );
    };
    return Channel(name: name, admin: admin);
  }

  static List<Channel> getChannels(String command) {
    List<String> eachChannels = command.split("/");
    List<Channel> channels = [];
    for (var element in eachChannels) {
      channels.add(getChannel(element));
    }
    return channels;
  }
}
