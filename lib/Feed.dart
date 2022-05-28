import 'package:flutter/material.dart';

import 'Post.dart';
class Feed extends StatefulWidget {
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
      return postWidget();
    });
  }
}

class postWidget extends StatefulWidget {
  Post post;
  postWidget({this.post});
  @override
  State<postWidget> createState() => _postWidgetState();
}

class _postWidgetState extends State<postWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage('https://quera.org/media/CACHE/images/public/avatars/7f6c9d7981bb4785b2d1fe571e574f43/93aff44bde76be50be9980c28a16bc46.jpg'),
                  radius: 25.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@johndoe',
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
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(widget.post.content),
          ),
        ],
      ),);
  }
}

