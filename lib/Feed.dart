import 'package:flutter/material.dart';

import 'Post.dart';
import 'Test.dart';

class Feed extends StatefulWidget {
  List<Post> posts = Test.listOfPosts();

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          return postWidget(widget.posts[index]);
        });
  }
}

class postWidget extends StatefulWidget {
  Post post;

  postWidget(this.post);

  @override
  State<postWidget> createState() => _postWidgetState();
}

class _postWidgetState extends State<postWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black12,
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget
                              .post.posterUser.ImageUrl ??
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                      radius: 25.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.post.posterUser.username,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@' + widget.post.posterUser.username,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  widget.post.content,
                  textDirection: TextDirection.ltr,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 4.0,
        )
      ],
    );
  }
}

